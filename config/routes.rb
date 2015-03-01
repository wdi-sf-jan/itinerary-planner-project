Rails.application.routes.draw do

  # login routes
  root 'access#home'

  get '/login' => 'access#login', as: :'login'
  post '/login' => 'access#attempt_login'

  get '/signup' => 'access#signup', as: 'signup'
  post '/signup' => 'access#create'

  delete '/logout' => 'access#logout', as: 'logout'
end
