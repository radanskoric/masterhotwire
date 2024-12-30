Bridgetown.initializer :paddle do |api_key:, environment: :sandbox|
  Bridgetown.logger.info "Paddle:", "Setting the API key (in #{environment} environment)"
  Paddle.configure do |config|
    # Use :development or :sandbox for the Sandbox API
    # Or use :production for the Production API
    config.environment = environment
    config.api_key = api_key

    # Set the API version. Defaults to 1
    config.version = 1
  end
end
