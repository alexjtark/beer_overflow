FactoryGirl.define do
  factory :answer_comment, class: "Comment" do
    # mad propz on understanding how to do associations in FactoryGirl
    association :author, factory: :user
    association :answer
    content {Faker::Hacker.say_something_smart}
  end
end
