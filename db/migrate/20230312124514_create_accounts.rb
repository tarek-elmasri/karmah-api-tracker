class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :area, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
