FactoryGirl.define do
  factory :question_comment, class: "Comment" do
    association :user
    association :question
    content {Faker::Hacker.say_something_smart}
  end
end