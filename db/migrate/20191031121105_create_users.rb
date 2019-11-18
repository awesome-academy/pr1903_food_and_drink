class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: true
      t.string :password_digest
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
