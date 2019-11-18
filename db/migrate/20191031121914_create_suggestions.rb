class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :picture
      t.string :description
      t.string :text
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
