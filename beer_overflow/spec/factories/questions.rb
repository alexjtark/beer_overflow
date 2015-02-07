FactoryGirl.define do
  factory :question do
    content {Faker::Hacker.sentence}
  end
end