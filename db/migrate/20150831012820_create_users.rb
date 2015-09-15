class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid

      t.string :name
      t.string :email
      t.string :gender
      t.integer :date_of_birth
      t.string :location

      t.string :interest, default: "Both"
      t.string :bio
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
