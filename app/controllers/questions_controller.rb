class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    answers = []
    # redirect_to edit_quiz_path params[:quiz_id]
    for i in 1..4
      answers << Answer.new( body: params["answer#{i}"] )
    end

    puts answers[0].body

    question = Question.new question_params
    question.quiz = Quiz.find params[:quiz_id].to_i
    question.answers = answers

    if question.save
      redirect_to edit_quiz_path params[:quiz_id].to_i
    else
      render json: question.errors
    end
  end

  def destroy
    question = find_question
    if question.destroy
      redirect_to edit_quiz_path question.quiz
    end
  end

  private

  def find_question
    Question.find params[:id]
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
