class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :comment
      t.string :git_url
      t.string :img

      t.timestamps null: false
    end
  end
end
