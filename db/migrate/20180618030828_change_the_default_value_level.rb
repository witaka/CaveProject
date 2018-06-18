class ChangeTheDefaultValueLevel < ActiveRecord::Migration[5.2]
  def change
    change_column :quizzes, :level, :string, default: 'beginner'
  end
end
