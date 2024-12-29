# TODO Move these to .env files, use bridgetown dotenv plugin
# TODO Check how bridgetown loads this, seems as if there's a race condition on
# loading this and the roda app.
ENV["DATABASE_URL"] = "sqlite://db/storage/test.db"
ENV["PADDLE_WEBHOOK_SECRET_KEY"] = "pdl_ntfset_01jf05a3t0w3n3z6dxgjmzbe4v_Q7F59cxFcNGByKdkI8TwDGrwPZ8sZrMm"

require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new]

require_relative "bridgetown_test"
require "database_cleaner/sequel"

require_relative "../server/db"

DatabaseCleaner.url_allowlist = [%r{^sqlite://db/storage}]
DatabaseCleaner[:sequel].db = DB
DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :truncation

class Minitest::Test
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def after_teardown
    super
    if !passed? && respond_to?(:last_response) && last_response
      puts "\nFAILED EXAMPLE HAD LAST RESPONSE \n Response body: \n"
      puts last_response.body
    end
  end
end
