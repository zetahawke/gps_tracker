class CreateGpsWaypoints < ActiveRecord::Migration[5.2]
  def change
    create_table :gps_waypoints do |t|
      t.references :vehicle, foreign_key: true
      t.string :longitude
      t.string :latitude
      t.datetime :sent_at

      t.timestamps
    end
  end
end
