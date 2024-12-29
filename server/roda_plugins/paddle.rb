require_relative "../lib/paddle_signature"

module RodaPlugins
  module Paddle
    def self.configure(app, opts = {})
      fail "webhook_secret_key is required on Paddle plugin" unless opts[:webhook_secret_key]
      plugin_opts = (app.opts[:paddle] ||= {})
      plugin_opts[:signature] = Lib::PaddleSignature.new(opts[:webhook_secret_key])

      plugin_opts.freeze
    end

    module RequestMethods
      def paddle_signature_valid?
        body.rewind
        roda_class.opts.dig(:paddle, :signature).verify(headers["Paddle-Signature"], body.read)
      end

      def verify_paddle_signature!
        unless paddle_signature_valid?
          response.status = 401
          response.headers[Roda::RodaResponseHeaders::CONTENT_TYPE] = "application/json"
          throw :halt, response.finish_with_body({ error: "Invalid signature" }.to_json)
        end
      end
    end
  end

  ::Roda::RodaPlugins.register_plugin :paddle, Paddle
end
