class Category < ApplicationRecord
  has_many :category_consumables
  has_many :of_categories, through: :category_consumables, source: :consumable
  has_many :consumables, through: :category_consumables

 # validates :category, presence :true
end
