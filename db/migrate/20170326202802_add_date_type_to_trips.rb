class AddDateTypeToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :date_type, :string
  end
end
