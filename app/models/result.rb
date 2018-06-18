class Result < ApplicationRecord
  belongs_to :quiz
  belongs_to :user

  validates :quiz_id, uniqueness: { scope: :user_id }
end
