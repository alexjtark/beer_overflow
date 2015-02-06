class PagesController < ApplicationController

def create
  answer = Answer.create(content: params[:answer][:content], responder_id: sessions[:id], question_id: params[:id])

  redirect_to question

end

def new
  @answer = Answer.new
end

def edit
end

def update
end

end
