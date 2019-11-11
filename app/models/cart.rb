class Cart < ApplicationRecord
  include Discard::Model
  
  has_many :cart_items
  has_many :consumables, through: :cart_items

  belongs_to :user

  validates :price_total, presence: true
  validates :status, presence: true  
end
