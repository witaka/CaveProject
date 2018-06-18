class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]


  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to edit_quiz_path(@quiz)
    else
      render :new
    end

  end

  def show
    @questions = @quiz.questions
  end

  def index
    @quizzes = Quiz.order(created_at: :desc)
  end

  def edit
    @quiz = find_quiz
    @question = Question.new
    @questions = @quiz.questions
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

  def test
    @params = params.require(:result)
    render json:@params 
  end

  private
  def quiz_params
    params.require(:quiz).permit(:title,:points,:passmark)
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end
 
end
