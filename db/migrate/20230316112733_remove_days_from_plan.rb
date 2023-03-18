class RemoveDaysFromPlan < ActiveRecord::Migration[7.0]
  def change
    remove_column :plans, :days
  end
end
