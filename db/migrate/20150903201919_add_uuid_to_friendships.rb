class AddUuidToFriendships < ActiveRecord::Migration
  def change
  	add_column :friendships, :uuid, :string
  end
end
