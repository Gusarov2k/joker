# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
# require 'action_text/engine'
# require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Joker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.api_only = true

    config.active_record.schema_format = :sql
    config.active_record.default_timezone = :local
    config.time_zone = 'Moscow'

    config.generators do |g|
      g.test_framework    :rspec,
                          fixtures: true,
                          views_spec: false,
                          helper_specs: false,
                          routing_specs: false,
                          request_specs: false,
                          controller_spec: true
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
