class AddBadgeidToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :badges, :integer, array:true, default: []
  end
end
