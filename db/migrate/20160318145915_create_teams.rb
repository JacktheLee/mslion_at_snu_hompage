class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :tema_number

      t.timestamps null: false
    end
  end
end
