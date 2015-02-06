class AnswersController < ApplicationController

def create
  answer = Answer.create(content: params[:answer][:content], responder_id: sessions[:id], question_id: params[:id])

  redirect_to :controller => 'question', :action => 'show', :id => params[:id]

end

def new
  @answer = Answer.new
end

def show
  @answer = Answer.find(params[:id])
  @question = Question.find(@answer.question_id)
  @responder = User.find(@answer.responder_id)
end

def edit
end

def update
end

end
