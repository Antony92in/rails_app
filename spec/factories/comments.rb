require 'faker'

FactoryBot.define do
  factory :comment do
    author { Faker::Name.name }
    comment { Faker::Lorem.characters(number: 100) }

    trait :false_author do
      author {}
    end

    trait :short_comment do
      comment { '1234' }
    end

    trait :long_comment do
      comment { Faker::Lorem.characters(number: 101) }
    end
  end
end
