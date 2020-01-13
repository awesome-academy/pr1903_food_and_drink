class AddColumnToCartItem < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :unit_price, :decimal, precision: 12, scale: 3
    add_column :cart_items, :total_price, :decimal, precision: 12, scale: 3
  end
end
