class AnswerVotesController < ApplicationController
  before_action :set_answer_vote, only: [:show, :destroy]

  def new
    @answer = Answer.find(params[:answer_id])
    @answer_vote = Vote.new
  end

  def create
    @answer_vote = Vote.new answer_vote_params
    @answer_vote.user = current_user
    if @answer_vote.save
      redirect_to '/' # this isn't working
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @answer_vote.destroy
  end

  private

  def set_answer_vote
    @answer_vote = Vote.find(params[:id])
  end

  def answer_vote_params
    params.require(:vote).permit(:liked, :votable_id, :votable_type)
  end

end