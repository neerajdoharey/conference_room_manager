Rails.application.routes.draw do
  resources :holidays
  resources :bookings
  resources :conference_rooms
  devise_for :users

  #devise_scope :user do
  root to: "bookings#new"
  #end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
