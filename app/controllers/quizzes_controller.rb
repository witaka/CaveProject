class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]


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
  
  def show
  end

  def index
    @quizzes = Quiz.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quiz_path(@quiz)
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  private
  def quiz_params
    params.require(:quiz).permit(:title,:points,:passmark)
  end
  
  def find_quiz
    @quiz = Quiz.find(params[:id])
    end

end
