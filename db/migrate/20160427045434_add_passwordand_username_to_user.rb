class AddPasswordandUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username
    add_column :users, :password, :string
  end
end
