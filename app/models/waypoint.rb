class Waypoint < ActiveRecord::Base
  belongs_to :itinerary

  has_many :users_waypoints
  has_many :users, through: :users_waypoints
end
