Bridgetown.configure do |config|
  # You can configure aspects of your Bridgetown site here instead of using
  # `bridgetown.config.yml`. For example:
  #
  # permalink "simple"
  # timezone "America/Los_Angeles"
  #
  # You can also modify options on the configuration object directly, like so:
  #
  # config.autoload_paths << "models"
  #

  # You can configure the inflector used by Zeitwerk. In v2.0,
  # ActiveSupport::Inflector will become the default.
  #
  config.inflector = ActiveSupport::Inflector
  #
  # Add new inflection rules using the following format. Inflections
  # are locale specific, and you may define rules for as many different
  # locales as you wish. All of these examples are active by default:
  # ActiveSupport::Inflector.inflections(:en) do |inflect|
  #   inflect.plural /^(ox)$/i, "\\1en"
  #   inflect.singular /^(ox)en/i, "\\1"
  #   inflect.irregular "person", "people"
  #   inflect.uncountable %w( fish sheep )
  # end
  #
  # These inflection rules are supported but not enabled by default:
  ActiveSupport::Inflector.inflections(:en) do |inflect|
    inflect.acronym "DB"
  end

  # You can use `init` to initialize various Bridgetown features or plugin gems.
  # For example, you can use the Dotenv gem to load environment variables from
  # `.env`. Just `bundle add dotenv` and then uncomment this:

  init :dotenv

  # Uncomment to use Bridgetown SSR (aka dynamic rendering of content via Roda):
  #
  init :ssr
  init :"bridgetown-routes"

  # Uncomment to use file-based dynamic template routing via Roda (make sure you
  # uncomment the gem dependency in your `Gemfile` as well):
  #
  # init :"bridgetown-routes"
  #

  # We also recommend that if you're using Roda routes you include this plugin
  # so you can get a generated routes list in `.routes.json`. You can then run
  # `bin/bridgetown roda:routes` to print the routes. (This will require you to
  # comment your route blocks. See example in `server/routes/hello.rb.sample`.)
  #
  # only :server do
  #   init :parse_routes
  # end
  #

  # For more documentation on how to configure your site using this initializers file,
  # visit: https://edge.bridgetownrb.com/docs/configuration/initializers/

  database_uri ENV.fetch("DATABASE_URL", "sqlite://db/storage/#{Bridgetown.env}.db")

  except :sequel_tasks do
    init :bridgetown_sequel do
      connection_options do
        extensions [:pretty_table]
        logger Logger.new("log/sql.log")
      end
    end
  end

  except :static do
    init :paddle,
      api_key: ENV["PADDLE_API_KEY"],
      environment: ENV["PADDLE_LIVE"] == "true" ? :production : :sandbox
  end

  only :server do
    init :mail, password: ENV["AMAZON_SES_PASSWORD"]
  end

  init :lifeform

  init :authtown do
    # Defaults, uncomment to modify:
    #
    # account_landing_page "/account/profile"
    # user_class_resolver -> { User }
    # user_name_field :first_name

    rodauth_config -> do
      email_from "Your Name <youremail@example.com>"

      reset_password_email_body do
        "Howdy! You or somebody requested a password reset for your account.\n" \
          "If that's legit, here's the link:\n#{reset_password_email_link}\n\n" \
          "Otherwise, you may safely ignore this message.\n\nThanks!\n–You @ Company"
      end

      enable :http_basic_auth if Bridgetown.env.test?

      # You can define additional options here as provided by Rodauth directly
    end
  end
end
