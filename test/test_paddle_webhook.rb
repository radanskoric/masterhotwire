require "minitest_helper"

class TestPaddleWebhook < Minitest::Test
  include Rack::Test::Methods

  def setup
    @email = "test@example.com"
    @paddle_id = "ctm_01h9x3fk4xpjhqz5vpn9gk8x"
  end

  def app
    RodaApp.app
  end

  def test_customer_created_webhook
    valid_payload = {
      event_type: "customer.created",
      data: {
        id: @paddle_id,
        email: @email,
        marketing_consent: false,
      }
    }

    start_count = Models::User.count

    post "/webhook/paddle", valid_payload.to_json, { "CONTENT_TYPE" => "application/json" }
    assert_equal 200, last_response.status

    assert_equal start_count + 1, Models::User.count

    user_id = JSON.parse(last_response.body)["user_id"]
    user = Models::User[user_id]
    assert_equal @email, user.email
    assert_equal @paddle_id, user.paddle_id
    assert_equal false, user.paid
    assert_equal false, user.marketing_consent
    assert_equal false, user.product_sent

    valid_payload[:data][:marketing_consent] = true

    post "/webhook/paddle", valid_payload.to_json, { "CONTENT_TYPE" => "application/json" }
    assert_equal 200, last_response.status

    assert_equal start_count + 1, Models::User.count
    user = Models::User[user_id]
    assert_equal @paddle_id, user.paddle_id
    assert_equal true, user.marketing_consent
  end

  def test_webhook_transaction_paid
    valid_payload = {
      event_type: "transaction.paid",
      data: {
        customer_id: @paddle_id
      }
    }

    Models::User.create(email: @email, paddle_id: @paddle_id, paid: false)
    start_user_count = Models::User.count

    post "/webhook/paddle", valid_payload.to_json, { "CONTENT_TYPE" => "application/json" }
    assert_equal 200, last_response.status

    assert_equal start_user_count, Models::User.count
    user_id = JSON.parse(last_response.body)["user_id"]
    user = Models::User[user_id]
    assert_equal @email, user.email
    assert_equal true, user.paid

    mails = Mail::TestMailer.deliveries
    assert_equal 1, mails.size
    mail = mails.first
    assert mail.subject.include?("Master Hotwire")
    assert_equal "application/pdf; filename=master-hotwire.pdf", mail.attachments.first.content_type
  end
end
