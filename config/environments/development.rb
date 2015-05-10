Theibarb::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.eager_load = false
  config.cache_store = :dalli_store, 'cachedata.ewc6ui.cfg.usw2.cache.amazonaws.com', {:namespace => 'rails_dev', :expires_in => 1.day, :compress => true }

  # Other config details
  config.colorize_logging = true

  console do
    # this block is called only when running console,
    # so we can safely require pry here
    require "pry"
    config.console = Pry
  end

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
