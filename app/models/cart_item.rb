class CartItem < ApplicationRecord
  include Discard::Model
  
  belongs_to :cart
  belongs_to :consumable

  validates :price, presence :true
end
