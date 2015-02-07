FactoryGirl.define do
  factory :question do
    association :asker, factory: :user
    content {Faker::Hacker.sentence}
  end
end