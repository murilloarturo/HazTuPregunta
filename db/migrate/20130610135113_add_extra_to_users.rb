class AddExtraToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :lname, :string
  end
end
