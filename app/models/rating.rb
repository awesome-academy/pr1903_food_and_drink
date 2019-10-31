class Rating < ApplicationRecord
  belongs_to :consumable
  belongs_to :user
end
