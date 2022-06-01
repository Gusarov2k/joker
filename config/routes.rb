# frozen_string_literal: true

Rails.application.routes.draw do
  get '/joke', as: :get_joke, action: :story, controller: :jokes
end
