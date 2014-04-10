class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :truck, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :user_address, null: false
      t.string :geocoded_address, null: false
      t.datetime :from, null: false
      t.datetime :to, null: false

      t.timestamps
    end
  end
end
