FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'secrets'
    password_confirmation 'secrets'

    trait :invalid do
      name nil
    end
  end
end
