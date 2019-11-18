class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :price
      t.references :consumable, null: false, foreign_key: true
      t.integer :quantity
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
