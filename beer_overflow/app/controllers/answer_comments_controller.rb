class AnswerCommentsController < ApplicationController
  before_action :set_answer_comment, only: [:show, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

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

 def upvote
  @answer_comment = Comment.find(params[:id])
  @vote = Vote.new(user: current_user, votable_id: @answer_comment.id, votable_type: "Comment", liked: true)
  unless @vote.save
    db_vote = Vote.where(user_id: current_user.id, votable_id: @answer_comment.id, votable_type: "Comment")[0]
    db_vote.update(liked: true)
  end
  redirect_to :back
end

def downvote
  @answer_comment = Comment.find(params[:id])
  @vote = Vote.new(user: current_user, votable_id: @answer_comment.id, votable_type: "Comment", liked: false)
  unless @vote.save
    db_vote = Vote.where(user_id: current_user.id, votable_id: @answer_comment.id, votable_type: "Comment")[0]
    db_vote.update(liked: false)
  end
  redirect_to :back
end

  private

  def set_answer_comment
    @answer_comment = Comment.find(params[:id])
  end

  def answer_comment_params
    params.require(:comment).permit(:content, :parent_id, :parent_type)
  end
end