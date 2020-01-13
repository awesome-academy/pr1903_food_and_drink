class CartItem < ApplicationRecord
  include Discard::Model

  belongs_to :cart
  belongs_to :consumable

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0}

  def unit_price
    if persisted?
      self[:unit_price]
    else
      consumable.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def consumable_present
    if consumable.nil?
      errors.add(:consumable, "is not vali or is not active")
    end
  end
  def cart_present
    if cart.nil?
      errors.add(:cart, "is not a vali order")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
