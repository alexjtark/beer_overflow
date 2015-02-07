class CommentVotesController < ApplicationController
  before_action :set_comment_vote, only: [:show, :destroy]

  def new
    @comment = Comment.find(params[:comment_id])
    @comment_vote = Vote.new
  end

  def create
    @comment_vote = Vote.new comment_vote_params
    @comment_vote.user = current_user
    if @comment_vote.save
      redirect_to '/' # this isn't working
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @comment_vote.destroy
  end

  private

  def set_comment_vote
    @comment_vote = Vote.find(params[:id])
  end

  def comment_vote_params
    params.require(:vote).permit(:liked, :votable_id, :votable_type)
  end

end