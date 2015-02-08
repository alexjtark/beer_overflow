class VotesController < ApplicationController
  before_filter: find_votable

  def find_votable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @votable = $1.classify.constantize.find(value)
      end
    end
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new vote_params
    @vote.user = current_user
    if @vote.save
      redirect_to '/'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @vote.destroy
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:liked, :votable_id, :votable_type)
  end
# simple_form_for [@parent, comment] do |form|

end