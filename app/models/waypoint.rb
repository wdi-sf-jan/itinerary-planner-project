class Waypoint < ActiveRecord::Base
  belongs_to :itinerary

  has_many :users_waypoints, dependent: :destroy
  has_many :users, through: :users_waypoints

  has_many :reviews, as: :reviewable

  def pretty_print
    self.date.to_date.to_formatted_s(:long)
  end
end
