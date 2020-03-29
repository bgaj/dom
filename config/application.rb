require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gospodarstwo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Europe/Warsaw'
    config.i18n.available_locales = [:pl, :en]
    config.i18n.default_locale = :pl
    config.i18n.load_path += Dir["#{Rails.root.to_s}/config/locales/**/*.{rb,yml}"]

    config.assets.precompile << /\.(?:svg|eot|woff|ttf|woff2)\z/

    config.autoload_paths += Dir[ Rails.root.join('app', 'models', '**/'), Rails.root.join('app', 'services', '**/') ]
  end
end
