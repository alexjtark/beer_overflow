FactoryGirl.define do
  factory :question_comment, class: "Comment" do
    association :author, factory: :user
    association :question
    content {Faker::Hacker.say_something_smart}
  end
end