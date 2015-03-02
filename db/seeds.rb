Review.destroy_all
Waypoint.destroy_all
Itinerary.destroy_all
User.destroy_all

tim = User.create(username: "tim",
                  password: "pizza",
                  first_name: "Tim",
                  last_name: "Licata",
                  email: "tim@lica.ta")

elie = User.create(username: "elie",
                   password: "anditsgone",
                   first_name: "Elie",
                   last_name: "Schoppik",
                   email: "elie@schopp.ik")

alex = User.create(username: "alex",
                   password: "boom",
                   first_name: "Alex",
                   last_name: "Notov",
                   email: "zealous@hack.er")

peter = User.create(username: "peter",
                    password: "snippets",
                    first_name: "Peter",
                    last_name: "Stidwell",
                    email: "peter@stidwe.ll")

myla = User.create(username: "myla",
                   password: "earrings",
                   first_name: "Myla",
                   last_name: "Baker",
                   email: "myla@bak.er")

eurotrip = Itinerary.create(name: "Eurotrip")
asiatrip = Itinerary.create(name: "Asiatrip")

salzburg = Waypoint.create(name: "Salzburg, Austria",
                           location: '{"lat":35.1243298,"lon":-77.342342}',
                           date: "2015-10-19 00:00:00")
berlin = Waypoint.create(name: "Berlin, Germany",
                         location: '{}',
                         date: "2015-10-20 00:00:00")

singapore = Waypoint.create(name: "Singapore",
                            location: "{}",
                            date: "2015-4-1 00:00:00")
tokyo = Waypoint.create(name: "Tokyo, Japan",
                        location: "{}",
                        date: "2015-4-5 00:00:00")

itinerary_review = Review.create(content: "Eurotrip is the best itinerary.")
itinerary_review.user = tim
itinerary_review.reviewable = eurotrip
itinerary_review.save

waypoint_review = Review.create(content: "Tokyo is the best waypoint.")
waypoint_review.user = myla
waypoint_review.reviewable = tokyo
waypoint_review.save

eurotrip.user = tim
eurotrip.guests << tim
eurotrip.guests << elie
eurotrip.guests << alex
eurotrip.waypoints << salzburg
eurotrip.waypoints << berlin
salzburg.users << tim
salzburg.users << elie
berlin.users << elie
berlin.users << alex

asiatrip.user = myla
asiatrip.guests << myla
asiatrip.guests << peter
asiatrip.waypoints << singapore
asiatrip.waypoints << tokyo
singapore.users << myla
tokyo.users << myla
tokyo.users << peter

eurotrip.save
asiatrip.save
salzburg.save
berlin.save
singapore.save
tokyo.save
tim.save
elie.save
alex.save
peter.save
myla.save

# puts "eurotrip creator: #{eurotrip.user.username}"
# puts "eurotrip guests: #{eurotrip.guests.map(&:first_name)}"
# puts "eurotrip waypoints: #{eurotrip.waypoints.map(&:name)}"
# puts "salzburg participants: #{salzburg.users.map(&:first_name)}"
# puts "berlin participants: #{berlin.users.map(&:first_name)}"
# puts "tims creations: #{tim.itineraries.map(&:name)}"
# puts "tims invitations: #{tim.invitations.map(&:name)}"
# puts "elies creations: #{elie.itineraries.map(&:name)}"
# puts "elies invitations: #{elie.invitations.map(&:name)}"
# puts "alexs creations: #{alex.itineraries.map(&:name)}"
# puts "alexs invitations: #{alex.invitations.map(&:name)}"

# puts "asiatrip creator: #{asiatrip.user.username}"
# puts "asiatrip guests: #{asiatrip.guests.map(&:first_name)}"
# puts "asiatrip waypoints: #{asiatrip.waypoints.map(&:name)}"
# puts "singapore participants: #{singapore.users.map(&:first_name)}"
# puts "tokyo participants: #{tokyo.users.map(&:first_name)}"
# puts "mylas creations: #{myla.itineraries.map(&:name)}"
# puts "mylas invitations: #{myla.invitations.map(&:name)}"
# puts "peters creations: #{peter.itineraries.map(&:name)}"
# puts "peters invitations: #{peter.invitations.map(&:name)}"
