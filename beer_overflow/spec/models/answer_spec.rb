require 'rails_helper'

describe Answer do
  it 'should return a valid question' do
    answer = Answer.new(
      content: "answer content")
    expect(answer).to be_valid
  end

  it 'should return an error if content is blank' do
    answer = Answer.new
    answer.valid?
    expect(answer.errors[:content]).to include("can't be blank")
  end

end