Bridgetown.initializer :mail do |password:|
  Mail.defaults do
    case ENV.fetch("BRIDGETOWN_ENV", "development")
    when "production"
      delivery_method :smtp,
                      address: 'email-smtp.us-east-1.amazonaws.com',
                      port: 587,
                      authentication: :plain,
                      user_name: ENV["AMAZON_SES_USERNAME"],
                      password:
    when "development"
      delivery_method :logger
    when "test"
      delivery_method :test
    else
      fail "Invalid BRIDGETOWN_ENV: #{ENV.fetch('BRIDGETOWN_ENV', :missing).inspect}"
    end
  end
end
