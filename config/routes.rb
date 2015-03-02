Rails.application.routes.draw do

  # login routes
  root 'access#home'

  get '/login' => 'access#login', as: :'login'
  post '/login' => 'access#attempt_login'

  get '/signup' => 'access#signup', as: 'signup'
  post '/signup' => 'access#create'

  delete '/logout' => 'access#logout', as: 'logout'

  # itineraries and waypoints
  resources :itineraries do
    resources :waypoints
  end

  post '/itineraries/:id/guests' => 'itineraries#add_guest', as: 'add_guest'
  delete '/itineraries/:id/guests/:guest_id' => 'itineraries#remove_guest', as: 'remove_guest'
  post '/itineraries/:itinerary_id/waypoints/:id/travelers' => 'waypoints#add_traveler', as: 'add_traveler'
  delete '/itineraries/:itinerary_id/waypoints/:id/travelers/:traveler_id' => 'waypoints#remove_traveler', as: 'remove_traveler'
end
