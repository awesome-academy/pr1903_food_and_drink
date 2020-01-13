class Cart < ApplicationRecord
  include Discard::Model

  enum status: {ordering: 0,ordered: 1}
  has_many :cart_items
  before_save :update_subtotal

  def subtotal
    cart_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price.to_i) : 0 }.sum
  end
private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
