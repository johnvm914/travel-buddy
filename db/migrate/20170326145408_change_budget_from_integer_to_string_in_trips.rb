class ChangeBudgetFromIntegerToStringInTrips < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :budget, :text
  end
end
