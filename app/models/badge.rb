class Badge < ApplicationRecord
  has_many :badgings
  has_many :users, through: :badgings
end
