# frozen_string_literal: true

FactoryBot.define do
  factory :joke do
    story { 'MyText' }
    minute_mark { 1 }
  end
end
