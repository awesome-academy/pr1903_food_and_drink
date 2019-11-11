class CreateCategoryConsumables < ActiveRecord::Migration[5.2]
  def change
    create_table :category_consumables do |t|
      t.references :consumable, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
