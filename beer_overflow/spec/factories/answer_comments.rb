FactoryGirl.define do
  factory :answer_comment, class: "Comment" do
    association :user
    association :answer
    content {Faker::Hacker.say_something_smart}
  end
end