class AddPermissionsandNameToLists < ActiveRecord::Migration
  def change
    add_column :lists, :name, :string
    add_column :lists, :permissions, :string
  end
end
