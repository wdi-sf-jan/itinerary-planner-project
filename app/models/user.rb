class User < ActiveRecord::Base
  has_many :itineraries

  has_many :itineraries_users
  has_many :invitations, through: :itineraries_users, source: :itinerary

  has_many :users_waypoints
  has_many :waypoints, through: :users
end
