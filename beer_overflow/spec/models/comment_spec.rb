require 'rails_helper'

describe Comment do
  it 'should return a valid comment' do
    comment = Comment.new(
      content: "comment content commenting on content")
    expect(comment).to be_valid
  end

  it 'should display a comments content' do
    comment = Comment.new(
      content: "comment content commenting on content")
    expect(comment.content).to eq 'comment content commenting on content'
  end

end