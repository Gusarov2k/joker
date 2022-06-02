# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GetJokes, type: :interactor do
  let(:memory_store) { ActiveSupport::Cache.lookup_store(:memory_store) }
  let(:ip) { Faker::Internet.ip_v4_address }
  let(:cache) { Rails.cache }

  before do
    allow(Rails).to receive(:cache).and_return(memory_store)
    Rails.cache.clear
  end

  describe '.call' do
    context 'with valid values' do
      subject(:context) { described_class.call(ip:) }

      let(:jokes) { create_list(:joke, 5, minute_mark: 0) }

      before do
        jokes
        travel_to Time.zone.local(2026, 11, 24, 0o0, 0o0, 44)
      end

      after do
        travel_back
      end

      it { expect(context).to be_a_success }
      it { expect(context.joke).to eq(jokes[0]) }
    end

    context 'when empty jokes' do
      subject(:context) { described_class.call(ip:) }

      before do
        travel_to Time.zone.local(2022, 11, 24, 0o1, 0o0, 44)
      end

      after do
        travel_back
      end

      it { expect(context).to be_a_failure }
      it { expect(context.error).to eq(I18n.t('messages.joke_not_find')) }
    end
  end
end
