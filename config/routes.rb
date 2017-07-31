Rails.application.routes.draw do
  resources :carriages
  resources :railway_stations
  resources :routes
  resources :trains
end
