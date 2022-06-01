# frozen_string_literal: true

class CreateJokes
  include Interactor::Organizer

  organize ParseJokes, WriteJokes
end
