Rails.application.routes.draw do
  resources :railway_stations
  resources :routes
  resources :trains

  resources :carriages
  resources :chair_carriages,   controller: "carriages", type: "ChairCarriage"
  resources :coupe_carriages,   controller: "carriages", type: "CoupeCarriage"
  resources :economy_carriages, controller: "carriages", type: "EconomyCarriage"
  resources :sv_carriages,      controller: "carriages", type: "SvCarriage"
end
