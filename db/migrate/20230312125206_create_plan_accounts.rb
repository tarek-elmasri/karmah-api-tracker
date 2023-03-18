class CreatePlanAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_accounts do |t|
      t.belongs_to :plan, null: false, foreign_key: true
      t.belongs_to :account, null: false, foreign_key: true
      t.text :objective, null:false

      t.timestamps
    end
  end
end
