# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  add_filter do |source_file|
    source_file.lines.count < 5
  end
  add_filter %r{app/channels/application_cable*}
  add_filter %r{app/uploaders/*}
end

require 'database_cleaner/active_record'
require 'json_matchers/rspec'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true

JsonMatchers.schema_root = 'spec/support/api/schemas'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:all) do
    DatabaseCleaner.clean
  end
end
