Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  root "searches#show"

  namespace :admin do
    get "panel", to: "base#panel"
    resources :railway_stations do
      patch :update_position,  on: :member
      patch :update_event,     on: :member
    end

    resources :routes

    resources :trains do
      resources :carriages, shallow: true
    end
    resources :tickets

    resources :chair_carriages,   controller: "carriages", type: "ChairCarriage"
    resources :coupe_carriages,   controller: "carriages", type: "CoupeCarriage"
    resources :economy_carriages, controller: "carriages", type: "EconomyCarriage"
    resources :sv_carriages,      controller: "carriages", type: "SvCarriage"

  end
  resource  :search,  only: [:show, :create]
  resources :tickets
end
