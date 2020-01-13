class AddColumnToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :subtotal, :decimal, precision: 12, scale: 3
    add_column :carts, :tax, :decimal, precision: 12, scale: 3
    add_column :carts, :shipping, :decimal, precision: 12, scale: 3
    add_column :carts, :total, :decimal, precision: 12, scale: 3
    add_reference :carts, :cart_status, foreign_key: true
  end
end
