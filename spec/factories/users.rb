FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    trait :player do
        games { build_list(:game, 3) }
    end
    trait :dm do
        dmed_games { build_list(:game, 2) }
    end
  end
end