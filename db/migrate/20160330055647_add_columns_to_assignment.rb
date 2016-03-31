class AddColumnsToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :assignment_title_id, :integer
  end
end
