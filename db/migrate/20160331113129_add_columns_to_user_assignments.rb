class AddColumnsToUserAssignments < ActiveRecord::Migration
  def change
    add_column :user_assignments, :submition, :boolean, default: false
  end
end
