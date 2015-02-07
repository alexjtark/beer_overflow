class QuestionVotesController < ApplicationController
  before_action :set_question_vote, only: [:show, :destroy]

  def new
    @question = Question.find(params[:question_id])
    @question_vote = Vote.new
  end

  def create
    @question_vote = Vote.new question_vote_params
    @question_vote.user = current_user
    if @question_vote.save
      redirect_to '/' # this isn't working
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @question_vote.destroy
  end

  private

  def set_question_vote
    @question_vote = Vote.find(params[:id])
  end

  def question_vote_params
    params.require(:vote).permit(:liked, :votable_id, :votable_type)
  end

end