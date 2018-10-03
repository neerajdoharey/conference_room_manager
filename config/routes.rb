Rails.application.routes.draw do
  resources :holidays
  resources :bookings
  resources :conference_rooms
  devise_for :users

  root to: "bookings#new"
  get 'cancel',to: "bookings#cancel"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
