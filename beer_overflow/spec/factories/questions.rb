FactoryGirl.define do
  factory :question do
    association :user
    content {Faker::Hacker.sentence}
  end
end