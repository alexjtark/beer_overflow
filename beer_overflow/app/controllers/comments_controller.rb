class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def index
    @question = Question.find(params[:question_id])
    @comments = @question.comments
  end

  def new
    @comment = Comment.new
    @question = Question.find(params[:question_id])
    # refactor the above to take the parent id or type
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = Comment.new comment_params
    if @comment.save
      redirect_to '/' # this isn't working
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @comment.destroy
    #redirect to current question
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_id, :parent_type, :author_id)
  end

end