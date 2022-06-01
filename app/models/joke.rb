# frozen_string_literal: true

class Joke < ApplicationRecord
  validates :story, presence: true
  validates :minute_mark, presence: true
end
