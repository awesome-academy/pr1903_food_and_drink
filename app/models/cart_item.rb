class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :consumable

  validates :price, presence :true
end
