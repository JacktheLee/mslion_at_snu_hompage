class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :score, :integer, default: 0
    add_column :users, :authority, :string, default: "student"
<<<<<<< HEAD
    add_column :users, :team_id, :integer
=======
>>>>>>> b801a4f23cae0234c49fc7e14c078aa72679ca26
  end
end
