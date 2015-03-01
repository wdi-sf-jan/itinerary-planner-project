class CreateItinerariesUsers < ActiveRecord::Migration
  def change
    create_table :itineraries_users do |t|
      t.references :itinerary, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
