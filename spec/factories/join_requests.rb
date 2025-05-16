FactoryBot.define do
  factory :join_request do
    user { nil }
    game { nil }
    message { "MyText" }
    status { "MyString" }
  end
end
