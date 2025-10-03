require "bridgetown"

Bridgetown.load_tasks

# Run rake without specifying any command to execute a deploy build by default.
task default: :deploy

#
# Standard set of tasks, which you can customize if you wish:
#
desc "Build the Bridgetown site for deployment"
task :deploy => [:clean, "frontend:build"] do
  Bridgetown::Commands::Build.start
end

desc "Build the site in a test environment"
task :test do
  ENV["BRIDGETOWN_ENV"] = "test"

  # TODO Move these to .env files, use bridgetown dotenv plugin
  # TODO Check how bridgetown loads this, seems as if there's a race condition on
  # loading this and the roda app.
  ENV["DATABASE_URL"] = "sqlite://db/storage/test.db"

  Bridgetown::Commands::Build.start
end

require "minitest/test_task"
Minitest::TestTask.create(:test) do |t| # add on to the test task
  t.warning = false
end

desc "Runs the clean command"
task :clean do
  Bridgetown::Commands::Clean.start
end

namespace :frontend do
  desc "Build the frontend with esbuild for deployment"
  task :build do
    sh "yarn run esbuild"
  end

  desc "Watch the frontend with esbuild during development"
  task :dev do
    sh "yarn run esbuild-dev"
  rescue Interrupt
  end
end

#
# Add your own Rake tasks here! You can use `environment` as a prerequisite
# in order to write automations or other commands requiring a loaded site.
#
# task :my_task => :environment do
#   puts site.root_dir
#   automation do
#     say_status :rake, "I'm a Rake tast =) #{site.config.url}"
#   end
# end

namespace :db do
  desc "Create a new migration file"
  task :migration, [:name] do |_t, args|
    name = args[:name] || "new_migration"
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    file = "db/migrations/#{timestamp}_#{name}.rb"
    File.write(file, <<~MIGRATION)
      Sequel.migration do
        change do
          # Your code goes here
        end
      end
    MIGRATION
    puts "Created #{file}"
  end

  desc "Run migrations"
  task :migrate, [:version] do |_t, args|
    require "sequel/core"
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(ENV.fetch("DATABASE_URL")) do |db|
      migrator = Sequel::TimestampMigrator.new(
        db,
        "db/migrations",
        target: version,
        allow_missing_migration_files: true,
        use_transactions: true
      )
      if migrator.is_current?
        puts "Database is up to date, no migration needed."
      else
        puts "Migrating database ..."
        migrator.run
        puts "Database migrated."
      end
    end
  end
end

namespace :paddle do
  desc "Sync the list of customers and their purchase status from Paddle"
  task sync: :environment do
    run_initializers
    # TODO Move to initializer
    require_relative "server/db"
    require_relative "server/models/user"

    total_count = 0
    paid_count = 0
    new_paid_count = 0
    # This is pretty inefficient, but it's a one-time sync and I don't have that
    # many customers. Improve it if it will be needed to be better in the future.
    customers = Paddle::Customer.list(status: "active", per_page: 10)
    while customers.data.size > 0
      customers.each do |customer|
        puts "Processing customer #{customer.id} (email: #{customer.email}) ..."
        user = Models::User.create_or_update(paddle_id: customer.id, email: customer.email)
        total_count += 1
        puts "User id: #{user.id}"

        if user.paid
          paid_count += 1
        else
          puts "User not marked as paid, checking transactions ..."
          transactions = Paddle::Transaction.list(status: "completed", customer_id: customer.id)

          paid = transactions.each.any? do |transaction|
            transaction.payments.any? { |payment| payment.status == "captured" }
          end

          if paid
            puts "User has PAID"
            user.update(paid: true)
            paid_count += 1
            new_paid_count += 1
          else
            puts "User has NOT PAID"
          end
        end
      end

      customers = Paddle::Customer.list(status: "active", per_page: 10, after: customers.last.id)
    end

    puts "SUMMARY: #{total_count} customers, #{paid_count} paid (#{new_paid_count} new paid detected)"
  end
end
