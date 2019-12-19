class Rating < ApplicationRecord
  belongs_to :consumable
  belongs_to :user
  validates :rating, :inclusion => 1..5
end
