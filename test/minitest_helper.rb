require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new]

# TODO Move this to .env files, use bridgetown dotenv plugin
ENV["DATABASE_URL"] = "sqlite://db/storage/test.db"

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
end
