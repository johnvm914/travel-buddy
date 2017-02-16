class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :image
      t.integer :age
      t.string :location
      t.text :bio

      t.timestamps
    end
  end
end
