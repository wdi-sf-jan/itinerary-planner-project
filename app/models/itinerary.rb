class Itinerary < ActiveRecord::Base
  belongs_to :user

  has_many :itineraries_users
  has_many :guests, through: :itineraries_users, source: :user

  has_many :waypoints
end
