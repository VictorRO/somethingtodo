FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'secrets'
    password_confirmation 'secrets'
    password_digest { User.digest('secrets') }

    trait :invalid do
      name nil
    end
  end
end
