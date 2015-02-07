FactoryGirl.define do
  factory :answer_comment, class: "Comment" do
    association :author, factory: :user
    association :answer
    content {Faker::Hacker.say_something_smart}
  end
end