class AddColumnsToUserAssignment < ActiveRecord::Migration
  def change
    add_column :user_assignments, :likbtn, :boolean, default: false
  end
end
