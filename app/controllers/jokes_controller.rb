# frozen_string_literal: true

class JokesController < ApplicationController
  def story
    service = GetJokes.call(ip: request.ip)

    render status: :ok, json: {
      data: [joke: service.joke]
    }
  end
end
