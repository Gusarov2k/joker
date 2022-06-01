# frozen_string_literal: true

class GetJokes
  include Interactor

  def call
    current_time = Time.now
    current_time_range = (current_time.strftime('%H').to_i * 60) + current_time.strftime('%M').to_i

    if Rails.cache.read("#{context.ip}_last_range") != current_time_range
      Rails.cache.fetch("#{context.ip}_last_range", expires_in: 1.minutes) { current_time_range }
      Rails.cache.delete("#{context.ip}_count_request")
      Rails.cache.fetch("#{context.ip}_count_request", expires_in: 1.minutes) { 1 }
    elsif Rails.cache.read("#{context.ip}_last_range") == current_time_range
      Rails.cache.increment("#{context.ip}_count_request", 1)
    else
      Rails.cache.fetch("#{context.ip}_last_range", expires_in: 1.minutes) { current_time_range }
      Rails.cache.fetch("#{context.ip}_count_request", expires_in: 1.minutes) { 1 }
    end

    jokes = Joke.where(minute_mark: Rails.cache.read("#{context.ip}_last_range"))

    context.joke = jokes[Rails.cache.read("#{context.ip}_count_request") - 1]
  end
end
