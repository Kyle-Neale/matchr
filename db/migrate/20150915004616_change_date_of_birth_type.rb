class ChangeDateOfBirthType < ActiveRecord::Migration
  def up
    change_column :users, :date_of_birth, :integer

  end

  def down
    change_column :users, :date_of_birth, :datetime

  end
end
