FactoryGirl.define do
  factory :comment do
    content {Faker::Hacker.say_something_smart}
  end
end