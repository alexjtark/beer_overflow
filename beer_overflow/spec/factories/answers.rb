FactoryGirl.define do
  factory :answer do
    association :responder, factory: :user
    association :question
    content {Faker::Lorem.paragraph}
  end
end
