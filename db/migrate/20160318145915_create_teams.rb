class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :team_number
      t.integer :week
      t.integer :team_score, default: 0

      t.timestamps null: false
    end
  end
end
