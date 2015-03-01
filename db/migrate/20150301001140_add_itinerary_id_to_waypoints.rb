class AddItineraryIdToWaypoints < ActiveRecord::Migration
  def change
    add_reference :waypoints, :itinerary, index: true
  end
end
