FactoryGirl.define do
  factory :message do
    title Faker::Name.title
    content Faker::Lorem.sentence(3)
  end
end
