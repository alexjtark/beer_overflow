class QuestionsController < ApplicationController

before_action :set_question, only: [:show, :edit, :destroy, :update]

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.asker = current_user
    if @question.save
      redirect_to @question
    else
      redirect_to :back
    end
  end

  def edit
  end

  def index
    @questions = Question.all
  end

  def update
    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    @question.destroy
    redirect_to '/'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  # def question_parameters_with_user_id
  #   question_params.merge(asker_id: session[:id])
  # end

  def question_params
    params.require(:question).permit(:title, :content)
  end
end