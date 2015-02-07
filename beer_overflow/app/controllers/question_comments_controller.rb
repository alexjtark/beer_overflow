class QuestionCommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def new
    @question = Question.find(params[:question_id])
    @question_comment = Comment.new
  end

  def create
    @question_comment = Comment.new question_comment_params
    question = @question_comment.parent
    @question_comment.author = current_user
    if @question_comment.save
      redirect_to question
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @question_comment.destroy
  end

  private

  def set_comment
    @question_comment = Comment.find(params[:id])
  end

  def question_comment_params
    params.require(:comment).permit(:content, :parent_id, :parent_type)
  end

end