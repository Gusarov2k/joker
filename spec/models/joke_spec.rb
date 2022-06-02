# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke, type: :model do
  subject(:joke) { build(:joke) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:story) }
    it { is_expected.to validate_presence_of(:minute_mark) }
    it { is_expected.to validate_numericality_of(:minute_mark).only_integer }
  end
end
