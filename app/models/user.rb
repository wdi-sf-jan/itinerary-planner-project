class User < ActiveRecord::Base
  has_many :itineraries

  has_many :itineraries_users, dependent: :destroy
  has_many :invitations, through: :itineraries_users, source: :itinerary

  has_many :users_waypoints, dependent: :destroy
  has_many :waypoints, through: :users

  has_secure_password
end
