class AddQuestionToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :quiz, foreign_key: true
  end
end
