class CreateConsumables < ActiveRecord::Migration[6.0]
  def change
    create_table :consumables do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.integer :price
      t.integer :quantity, default: 0
      t.float :rate_average

      t.timestamps
    end
  end
end
