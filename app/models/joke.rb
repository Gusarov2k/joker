# frozen_string_literal: true

class Joke < ApplicationRecord
  validates :story, presence: true
  validates :minute_mark,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
