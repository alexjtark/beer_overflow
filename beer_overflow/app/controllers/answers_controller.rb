class AnswersController < ApplicationController

def create
  answer = Answer.create(content: params[:answer][:content], responder_id: current_user.id, question_id: params[:answer][:question_id])

  redirect_to :controller => 'questions', :action => 'show', :id => params[:answer][:question_id]
end

def new
  @answer = Answer.new
end

def show
  @answer = Answer.find(params[:id])
  render :show, locals: {answer: @answer}
end

def upvote
  @answer = Answer.find(params[:id])
  @vote = Vote.new(user: current_user, votable_id: @answer.id, votable_type: "Answer", liked: true)
  unless @vote.save
    db_vote = Vote.where(user_id: current_user.id, votable_id: @answer.id, votable_type: "Answer")[0]
    db_vote.update(liked: true)
  end
  redirect_to :back
end

def downvote
  @answer = Answer.find(params[:id])
  @vote = Vote.new(user: current_user, votable_id: @answer.id, votable_type: "Answer", liked: false)
  unless @vote.save
    db_vote = Vote.where(user_id: current_user.id, votable_id: @answer.id, votable_type: "Answer")[0]
    db_vote.update(liked: false)
  end
  redirect_to :back
end


private

def answer_params
  params.require(:answer).permit(:responder_id, :content, :question_id)
end

end
