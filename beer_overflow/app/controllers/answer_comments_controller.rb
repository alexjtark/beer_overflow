class AnswerCommentsController < ApplicationController
  before_action :set_answer_comment, only: [:show, :destroy]

  def new
    @answer_comment = Comment.new
    @answer = Answer.find(params[:answer_id])
  end

  def create
    @answer_comment = Comment.new answer_comment_params
    question = @answer_comment.parent.question
    @answer_comment.author = current_user
    if @answer_comment.save
      redirect_to question
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @answer_comment.destroy
  end

  private

  def set_answer_comment
    @answer_comment = Comment.find(params[:id])
  end

  def answer_comment_params
    params.require(:comment).permit(:content, :parent_id, :parent_type)
  end
end