require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Skipabledevisetwofactor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
		ENV['ENCRYPTION_KEY'] = "0d09ef93a909986c9c1cd7b2e2e502438bd0aacc7dcf89fe7f97dce719f8743ed9d57748d256092cebf30167c1940a6a6faac9cd756d5f2f02dcac25790678ff"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
