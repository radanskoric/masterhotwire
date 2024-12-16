# Roda is a simple Rack-based framework with a flexible architecture based
# on the concept of a routing tree. Bridgetown uses it for its development
# server, but you can also run it in production for fast, dynamic applications.
#
# Learn more at: https://www.bridgetownrb.com/docs/routes

require_relative "db"
require_relative "models/user"
require_relative "mailer"

require 'sentry-ruby'
Sentry.init do |config|
  config.dsn = ENV["SENTRY_DSN"]
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  config.traces_sample_rate = 0.1
  config.profiles_sample_rate = 0.2
end

class RodaApp < Roda
  use Sentry::Rack::CaptureExceptions
  plugin :bridgetown_server
  plugin :json_parser

  # Some Roda configuration is handled in the `config/initializers.rb` file.
  # But you can also add additional Roda configuration here if needed.

  route do |r|
    # Load Roda routes in server/routes (and src/_routes via `bridgetown-routes`)
    r.bridgetown

    r.on "webhook" do
      # Paddle webhook endpoint for customer creation
      r.post "paddle" do
        # Process the webhook payload
        payload = r.params

        if payload["event_type"] == "customer.created"
          user = Models::User.create_or_update(
            email: payload["data"]["email"],
            paddle_id: payload["data"]["id"],
            marketing_consent: payload["data"]["marketing_consent"]
          )
        elsif payload["event_type"] == "transaction.paid"
          user = Models::User.first(paddle_id: payload["data"]["customer_id"])
          user.update(paid: true)
          Mailer.sendmail("/users/#{user.id}/purchase")
        end

        # Return 200 OK status
        response.status = 200
        response.headers["Content-Type"] = "application/json"
        { user_id: user&.id }
      end
    end
  end
end
