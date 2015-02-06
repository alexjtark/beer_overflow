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
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(username: Faker::Internet.user_name, email: nil)
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a unique username" do

  end

  it "is invalid without a unique email" do

  end

end


 it "is invalid without a firstname" do
contact = Contact.new(firstname: nil)
contact.valid?
expect(contact.errors[:firstname]).to include("can't be blank")
end


describe Contact do
4 it "is valid with a firstname, lastname and email"
5 it "is invalid without a firstname"
6 it "is invalid without a lastname"
7 it "is invalid without an email address"
8 it "is invalid with a duplicate email address"
9 it "returns a contact's full name as a string"
10 end
