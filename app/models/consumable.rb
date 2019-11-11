class Consumable < ApplicationRecord
  include Discard::Model

  scope :not_discarded, -> { where(discarded_at: nil)}
  # Ex:- scope :active, -> {where(:active => true)}
  
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :category_consumables
  has_many :categories, through: :category_consumables
  has_many :ratings

  has_many_attached :pictures

  validates :name, presence: true, 
                   length: {minimum: 1, maximum: 100}
  # validates :picture, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
