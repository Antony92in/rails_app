FactoryBot.define do
  factory :post do
    title { 'title' }
    content { 'some content' }
    author { rand(1..10) }

    trait :false_author do
      author { }
    end

    trait :false_title do 
      title { '1234' }
    end

  end
end
