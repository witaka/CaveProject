class User < ApplicationRecord
  has_many :quzzes, through: :results  
  has_secure_password()

  def full_name
    first_name + " " + last_name
  end 
end
