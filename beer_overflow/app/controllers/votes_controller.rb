class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if @vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def show
  end

  def destroy
    @vote.destroy
  end

  private

  def vote_params
    params.require(:vote).permit(:liked, :votable_id, :votable_type)
  end
end
