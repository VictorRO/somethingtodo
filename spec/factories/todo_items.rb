FactoryGirl.define do
  factory :todo_item do
    title { Faker::Lorem.sentence }
    done false
  end
end
