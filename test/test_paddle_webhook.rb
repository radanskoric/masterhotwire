require "minitest_helper"

class TestPaddleWebhook < Minitest::Test
  include Rack::Test::Methods

  def setup
    @email = "test@example.com"
    @paddle_id = "ctm_01h9x3fk4xpjhqz5vpn9gk8x"
  end

  def customer_created_payload
    {
      event_type: "customer.created",
      data: {
        id: @paddle_id,
        email: @email,
        marketing_consent: false,
      }
    }
  end

  def transaction_paid_payload
    {
      event_type: "transaction.paid",
      data: {
        customer_id: @paddle_id
      }
    }
  end

  def app
    RodaApp.app
  end

  def calculate_paddle_signature(json_payload, timestamp)
    signed_payload = "#{timestamp}:#{json_payload}"
    signature = OpenSSL::HMAC.hexdigest("SHA256", ENV["PADDLE_WEBHOOK_SECRET_KEY"], signed_payload)
    paddle_signature = "ts=#{timestamp};h1=#{signature}"
  end

  def post_paddle_webhook(payload)
    json_payload = payload.to_json

    paddle_signature = calculate_paddle_signature(json_payload, Time.now.to_i.to_s)

    post "/webhook/paddle",
         json_payload,
         {
           "CONTENT_TYPE" => "application/json",
           "HTTP_PADDLE_SIGNATURE" => paddle_signature
         }
  end

  def test_customer_created_webhook
    start_count = Models::User.count

    post_paddle_webhook(customer_created_payload)
    assert_equal 200, last_response.status

    assert_equal start_count + 1, Models::User.count

    user_id = JSON.parse(last_response.body)["user_id"]
    user = Models::User[user_id]
    assert_equal @email, user.email
    assert_equal @paddle_id, user.paddle_id
    assert_equal false, user.paid
    assert_equal false, user.marketing_consent
    assert_equal false, user.product_sent

    accept_marketing_consent_payload = customer_created_payload
    accept_marketing_consent_payload[:data][:marketing_consent] = true

    post_paddle_webhook(accept_marketing_consent_payload)
    assert_equal 200, last_response.status

    assert_equal start_count + 1, Models::User.count
    user = Models::User[user_id]
    assert_equal @paddle_id, user.paddle_id
    assert_equal true, user.marketing_consent
  end

  def test_webhook_transaction_paid
    Models::User.create(email: @email, paddle_id: @paddle_id, paid: false)
    start_user_count = Models::User.count

    post_paddle_webhook(transaction_paid_payload)
    assert_equal 200, last_response.status

    assert_equal start_user_count, Models::User.count
    user_id = JSON.parse(last_response.body)["user_id"]
    user = Models::User[user_id]
    assert_equal @email, user.email
    assert_equal true, user.paid
    assert_equal true, user.product_sent

    mails = Mail::TestMailer.deliveries
    assert_equal 0, mails.size # Shadow rollout, no emails for now
    # mail = mails.first
    # assert mail.subject.include?("Master Hotwire")
    # assert_equal "application/pdf; filename=master-hotwire.pdf", mail.attachments.first.content_type
  end

  def test_webhook_with_invalid_signature
    post "/webhook/paddle",
         customer_created_payload.to_json,
         {
           "CONTENT_TYPE" => "application/json",
           "HTTP_PADDLE_SIGNATURE" => "this is not a valid signature"
         }
    assert_equal 401, last_response.status
    assert_equal "Invalid signature", JSON.parse(last_response.body)["error"]
  end

  def test_webhook_with_invalid_timestamp
    json_payload = customer_created_payload.to_json
    paddle_signature = calculate_paddle_signature(json_payload, (Time.now.to_i - 5).to_s)

    post "/webhook/paddle",
         json_payload,
         {
           "CONTENT_TYPE" => "application/json",
           "HTTP_PADDLE_SIGNATURE" => paddle_signature
         }
    assert_equal 401, last_response.status
    assert_equal "Invalid signature", JSON.parse(last_response.body)["error"]
  end
end
