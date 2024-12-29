module Lib
  class PaddleSignature
    def initialize(secret_key)
      @secret_key = secret_key
    end

    # Implement Paddle Webhook Signature Verification based on:
    # https://developer.paddle.com/webhooks/signature-verification
    def verify(signature_header, body)
      return false unless signature_header

      timestamp, signature = parse_header(signature_header)
      return false unless timestamp && signature
      return false unless (Time.now.to_i - timestamp.to_i).abs < 5

      signed_payload = "#{timestamp}:#{body}"
      expected_signature = OpenSSL::HMAC.hexdigest("SHA256", @secret_key, signed_payload)
      signature == expected_signature
    end

    private

    def parse_header(signature_header)
      signature_header
        .split(";")
        .map { |pair| pair.split("=") }
        .to_h
        .values_at("ts", "h1")
    rescue ArgumentError
      []
    end
  end
end
