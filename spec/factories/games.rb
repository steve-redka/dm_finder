FactoryBot.define do
  factory :game do
    title { Faker.name }
    description { Faker::Lorem.paragraph }
    age_restriction { '18+' }
    application_process { Faker::Lorem.paragraph }
    price { 10.0 }
    duration { 2.0 }
    seats { 4 }
    experience { 'Beginner' }
    system { 'Dungeons & Dragons 5th Edition' }
    power_level { 'Starting level 1, max level 10' }
    recurrence { 'one-shot' }
    gaming_system { GamingSystem.first || association(:gaming_system) }
    next_game { DateTime.now + 1.week }
    game_time { Time.now + 1.week }
    dm { association(:user) }
  end
end
