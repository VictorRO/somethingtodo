FactoryGirl.define do
  factory :task do
    title { Faker::Lorem.sentence }
    done false
  end
end
