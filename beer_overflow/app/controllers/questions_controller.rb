class QuestionsController < ApplicationController

before_action :set_question, only: [:show, :edit, :destroy, :update]

  def show
  end

  def edit
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end
end