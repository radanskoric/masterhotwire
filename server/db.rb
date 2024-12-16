require "sqlite3"
require "sequel"
require "logger"

# Configure Sequel with SQLite-specific settings
DB ||= Sequel.connect(
  ENV.fetch("DATABASE_URL"),
  journal_mode: :wal,  # Use Write-Ahead Logging for better concurrency.
  synchronous: :normal, # Good balance between safety and speed, recommended when WAL is on.
  logger: Logger.new($stdout)
)
