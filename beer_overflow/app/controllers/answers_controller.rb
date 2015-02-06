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

end

private

def answer_params
  params.require(:answer).permit(:responder_id, :content, :question_id)
end

end
