class AddLevelToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :level, :string, default: 'beginer'
  end
end
