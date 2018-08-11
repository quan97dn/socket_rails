require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SocketRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    if defined?(Rails::Server)
      config.after_initialize do
        Rails.application.load_tasks
        Rake::Task['start:setIntervel'].invoke
      end
    end

    config.cache_store = :redis_store, {
      host: "localhost",
      port: 6379,
      db: 0,
    }, {expires_in: 7.days}
  end
end
