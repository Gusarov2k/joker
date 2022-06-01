# frozen_string_literal: true

FactoryBot.define do
  factory :joke do
    story { Faker::Name.unique.name }
    minute_mark { Faker::Number.within(range: 0.0..1440.0).round(0) }
  end
end
