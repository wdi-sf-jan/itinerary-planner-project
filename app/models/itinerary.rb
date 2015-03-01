class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :waypoints
end
