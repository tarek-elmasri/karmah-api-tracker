class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.integer :days, null:false
      t.belongs_to :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
