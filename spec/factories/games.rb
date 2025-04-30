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
    recurrence { 'once' }
    # Creates a user who is a DM
    # association :dm, factory: :user, strategy: :create, traits: [:dm]
  end
end
