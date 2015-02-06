class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def create

  end

  def new
    @comment = Comment.new
  end

  def show

  end

  def destroy

  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_id, :parent_type, :author_id)
  end

end