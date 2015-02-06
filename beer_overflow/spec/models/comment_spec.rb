require 'rails_helper'

describe Comment do
  it 'should return a valid comment' do
    comment = Comment.new(
      content: "comment content commenting on content")
    expect(comment).to be_valid
  end

end