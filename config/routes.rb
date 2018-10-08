Rails.application.routes.draw do
  resources :holidays
  resources :bookings, except: [:destroy]
  resources :conference_rooms
  resources :facilities
  devise_for :users, :controllers => { :registrations => 'user/registrations' }

  root to: "bookings#index"
  get 'cancel',to: "bookings#cancel"
  get 'search_rooms', to: 'conference_rooms#search_rooms'
  get 'search', to: 'conference_rooms#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
