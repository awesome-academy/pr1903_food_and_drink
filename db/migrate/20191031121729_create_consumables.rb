class CreateConsumables < ActiveRecord::Migration[5.2]
  def change
    create_table :consumables do |t|
      t.string :name
      t.string :pictures
      t.text :description
      t.integer :price
      t.integer :quantity, default: 0
      t.float :rate_average
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
