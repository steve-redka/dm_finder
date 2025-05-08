FactoryBot.define do
  factory :chat_message do
    content { Faker::Lorem.sentence }
    association :chat_room
    association :user
  end
end