FactoryBot.define do
  factory :follower do
    followed_user { build(:user) }
    follower { build(:user) }

    trait :false_follower do
      follower {}
    end

    trait :false_followed_user do
      followed_user {}
    end
  end
end
