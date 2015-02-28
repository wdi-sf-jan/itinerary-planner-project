class CreateWaypoints < ActiveRecord::Migration
  def change
    create_table :waypoints do |t|
      t.string :name
      t.json :location
      t.datetime :date

      t.timestamps
    end
  end
end
