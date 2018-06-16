class QuizzesController < ApplicationController
  
  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end

  end

  def index
    @quizzes = Quiz.order(created_at: :desc)
  end

end
