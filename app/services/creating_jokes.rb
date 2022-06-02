# frozen_string_literal: true

class CreatingJokes
  include Interactor::Organizer

  organize ParseJokes, WriteJokes
end
