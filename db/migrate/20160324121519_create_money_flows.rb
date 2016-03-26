class CreateMoneyFlows < ActiveRecord::Migration
  def change
    create_table :money_flows do |t|

      t.timestamps null: false
    end
  end
end
