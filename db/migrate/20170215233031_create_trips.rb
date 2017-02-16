class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :type
      t.string :destination
      t.date :begin_date
      t.date :end_date
      t.integer :budget
      t.text :description
      t.text :wish_list

      t.timestamps
    end
  end
end
