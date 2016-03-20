class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :score, :integer, default: 0
    add_column :users, :authority, :string, default: "student"
  end
end
