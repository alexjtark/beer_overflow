require 'rails_helper'

describe User do
  it "is valid with a username and email"
    user = User.new(
      username: Faker::Internet.user_name,
      email: Faker::Internet.email
      )
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = User.new(username: nil, email: Faker::Internet.email)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(username: Faker::Internet.user_name, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a unique username" do
    User.create(username: 'bunday', email: 'iluvu@peace.com')
    user = User.new(username: 'bunday', email: 'test@test.com')
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end

  it "is invalid without a unique email" do
    User.create(username: 'bunday', email: 'iluvu@peace.com')
    user = User.new(username: 'harry', email: 'iluvu@peace.com')
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
