class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    render json: params
  end
end
