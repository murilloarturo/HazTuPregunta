class AddIndexToUsers < ActiveRecord::Migration
  def change
  end

	add_index :users, :username, :unique => true
end
