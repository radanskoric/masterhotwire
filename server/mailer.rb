# frozen_string_literal: true
require "mail"

Mail.defaults do
  case ENV.fetch("BRIDGETOWN_ENV", "development")
  when "production"
    delivery_method :smtp,
                    address: 'email-smtp.us-east-1.amazonaws.com',
                    port: 587,
                    authentication: :plain,
                    user_name: ENV["AMAZON_SES_USERNAME"],
                    password: ENV["AMAZON_SES_PASSWORD"]
  when "development"
    delivery_method :logger
  when "test"
    delivery_method :test
  else
    fail "Invalid BRIDGETOWN_ENV: #{ENV.fetch('BRIDGETOWN_ENV', :missing).inspect}"
  end
end

class Mailer < Roda
  opts[:root] = File.dirname(__FILE__)

  plugin :render, views: "emails", layout: nil
  plugin :mailer

  route do |r|
    from "Master Hotwire Author <me@radanskoric.com>"

    r.on "users", Integer do |user_id|
      no_mail! unless (@user = Models::User[user_id])

      to @user.email

      r.mail "purchase" do
        subject "Your copy of Master Hotwire is here!"
        text_part render("purchase.txt")
        add_file "src/master-hotwire.pdf"
      end
    end
  end
end
