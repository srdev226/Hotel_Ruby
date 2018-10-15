Rails.application.routes.draw do

  # devise_for :users, controllers:  {omniauth_callbacks: "omniauth_callbacks" }
  devise_for :users, controllers:  {omniauth_callbacks: "registrations", sessions: "sessions" }
  devise_for :admins, controllers: {registrations: "registrations"}
  devise_for :sellers, controllers: {registrations: "registrations"}
  devise_for :buyers, controllers: {registrations: "registrations"}

  # root to: redirect('hginapa')

  # namespace :hginapa do
    resources :users do
      resources :listings
    end
    
    post "users/admin_create" => "users#create", as: :admin_user_create

    resources :listings do
    	member do
    		patch :complete
        post :pay
        patch :switch
        patch :approved
        get 'payment-confirmation', action: :confirmation
    	end
    end

    get 'users/:id/user_listings' => 'users#user_listings', :as => :custom_user_listings

    get 'admin'  => 'listings#admin'

    get 'contact'  => 'listings#contact'

    get 'faq'  => 'listings#faq'

    get 'buy' => 'listings#buy'

    # change room types based on hotel
    post 'listings/changeRoomTypes' => 'listings#changeRoomTypes'
    # search routes
    get  '/:hotel' => 'listings#index'
    post '/search' => 'listings#search', :as => :search

    root 'listings#index'
  # end
end
