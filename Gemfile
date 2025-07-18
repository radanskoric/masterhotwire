source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

####
# Welcome to your project's Gemfile, used by Rubygems & Bundler.
#
# To install a plugin, run:
#
#   bundle add new-plugin-name -g bridgetown_plugins
#
# This will ensure the plugin is added to the correct Bundler group.
#
# When you run Bridgetown commands, we recommend using a binstub like so:
#
#   bin/bridgetown start (or console, etc.)
#
# This will help ensure the proper Bridgetown version is running.
####

# If you need to upgrade/switch Bridgetown versions, change the line below
# and then run `bundle update bridgetown`
gem "bridgetown", "~> 1.3.4"
gem "bridgetown-seo-tag"
gem "dotenv"

# Uncomment to add file-based dynamic routing to your project:
# gem "bridgetown-routes", "~> 1.3.4"

# Puma is the Rack-compatible web server used by Bridgetown
# (you can optionally limit this to the "development" group)
gem "puma", "< 7"

gem "sequel", github: "radanskoric/sequel", branch: "support-wal-mode-on-sqlite"
gem "sqlite3"

gem "mail"

gem "paddle", "~> 2.6"

# Uncomment to use the Inspectors API to manipulate the output
# of your HTML or XML resources:
# gem "nokogiri", "~> 1.13"

gem "debug"
gem "stackprof"
gem "sentry-ruby"

group :test do
  gem "minitest"
  gem "minitest-reporters"
  gem "rack-test"

  gem "database_cleaner-sequel"
end
