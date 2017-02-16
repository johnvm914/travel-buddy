class ChangeTypeNameInTrips < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :type, :trip_type
  end
end
