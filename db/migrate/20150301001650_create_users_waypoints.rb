class CreateUsersWaypoints < ActiveRecord::Migration
  def change
    create_table :users_waypoints do |t|
      t.references :user, index: true
      t.references :waypoint, index: true

      t.timestamps
    end
  end
end
