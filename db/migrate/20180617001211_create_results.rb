class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :tries
      t.float :score
      t.boolean :claimed, default: false

      t.timestamps
    end
  end
end
