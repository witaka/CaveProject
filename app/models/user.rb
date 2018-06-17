class User < ApplicationRecord
  has_secure_password()
  has_many :results, dependent: :destroy
  has_many :badgings
  has_many :badges, through: :badgings

  def full_name
    first_name + " " + last_name
  end 
end
