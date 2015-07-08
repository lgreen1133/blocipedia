class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :confirmation_token
      t.datetime :confirmed_at

      t.timestamps null: false
    end
    add_index :users, :email 
  end
end
