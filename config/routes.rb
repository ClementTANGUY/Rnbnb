Rails.application.routes.draw do


  devise_for :users, :path=>'',
                    :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'} ,
					:controllers => {
            :registrations => 'registrations',
            :confirmations => 'confirmations'
             }

  root 'pages#home'

  resources :users, only: [:show]




  resources :rooms, path: 'annonces' do

    resources :reservations, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end

  resources :photos

  get '/search' => 'pages#search'


  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'

  get 'voyages' => 'reservations#your_trips', as: 'your_trips'
  get 'reservations' => 'reservations#your_reservations', as: 'your_reservations'


end
