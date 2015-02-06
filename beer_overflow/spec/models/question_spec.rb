require 'rails_helper'

describe 'Initial Test' do
  it 'should test if true is true' do
    expect(true).to eq true
  end
end

describe Question do
  it 'should return a valid question' do
    question = Question.new(
      title: "question title",
      content: "question content")
    expect(question).to be_valid
  end

  it 'should return an error if title is blank' do
    question = Question.new(content: "question content")
    question.valid?
    expect(question.errors[:title]).to include("can't be blank")
  end

  it 'should return an error if content is blank' do
    question = Question.new(title: "question title")
    question.valid?
    expect(question.errors[:content]).to include("can't be blank")
  end
end

