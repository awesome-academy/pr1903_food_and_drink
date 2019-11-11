class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :consumable, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :rating

      t.timestamps
    end
  end
end
