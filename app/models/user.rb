class User < ActiveRecord::Base
  has_many :itineraries

  has_many :users_waypoints
  has_many :waypoints, through: :users
end
