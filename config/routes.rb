Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'gps_waypoints#show'

  get '/show', to: 'gps_waypoints#show'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'gps', to: 'gps_waypoints#insert_gps_waypoint'
    end
  end
end
