require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Peppa
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    # ENV['CORS_ORIGINS'] = 'https://foodfie-65a8c.firebaseapp.com, http://localhost:3000, http://10.90.90.102:3000'

    config.action_mailer.default_url_options = { host: 'https://foodfie.herokuapp.com/' } 
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.autoload_paths << Rails.root.join('lib')

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true

    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end

      allow do
        origins 'https://foodfie-api.firebaseapp.com'
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end

      allow do
        origins 'http://10.90.90.102:3000'
        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end

    end
  end
end
