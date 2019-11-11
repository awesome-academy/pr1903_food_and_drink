class CategoryConsumable < ApplicationRecord
  belongs_to :consumable
  belongs_to :category
end
