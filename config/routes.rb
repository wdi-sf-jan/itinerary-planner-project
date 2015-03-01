Rails.application.routes.draw do

  # login routes
  root 'access#home'

  get '/login' => 'access#login', as: :'login'
  post '/login' => 'access#attempt_login'

  get '/signup' => 'access#signup', as: 'signup'
  post '/signup' => 'access#create'

  delete '/logout' => 'access#logout', as: 'logout'

  # itinerary routes
  resources :itineraries
  post '/itinerary/:id/guests' => 'itineraries#add_guest', as: 'add_guest'
  delete '/itinerary/:id/guests/:guest_id' => 'itineraries#remove_guest', as: 'remove_guest'
end
