class CreateAssignmentTitles < ActiveRecord::Migration
  def change
    create_table :assignment_titles do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
