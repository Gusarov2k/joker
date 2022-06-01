# frozen_string_literal: true

module Rack
  class Attack
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new # defaults to Rails.cache

    throttle('blocking_joke', limit: 5, period: 1.minute) do |req|
      req.ip if req.path.start_with?('/joke')
    end
  end
end
