class UsersWaypoint < ActiveRecord::Base
  belongs_to :user
  belongs_to :waypoint
end
