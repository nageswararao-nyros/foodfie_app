Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root 'home#landing_page'
  get '/search' => 'home#index'
  get '/suburbs' => 'home#suburbs'
  post '/location_search' => 'home#location_search'
  get '/activate' => 'activations#index'
  get '/get_restaurant_dishes' => 'dishes#get_restaurant_dishes'
  resources :dishes, only: [:show] do
    collection do
      get :search
    end
  end
  resources :restaurants, only: [:show]

  namespace :api do
    namespace :v1 do
      get '/reset_password' => 'registrations#show_reset_password'
      post '/reset_password' => 'registrations#reset_password'
    end
  end
  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      get '/share_text' => 'settings#share_text'
      post '/signup' => 'registrations#create'
      get '/terms_url' => 'registrations#terms_url'
      get '/activate' => 'activations#activate'
      get '/resend_activation_email' => 'activations#resend_activation_email'
      post '/signin' => 'sessions#create'
      get '/signout' => 'sessions#destroy'
      post '/forget_password' => 'registrations#forget_password'
      post '/notification_settings' => 'settings#notification_settings'
      get '/settings_info' => 'settings#settings_info'
      resources :users, only: [:index, :update] do
        collection do
          get :search
          get :favourited_restaurants
          get :followed_restaurants
          get :favourited_dishes
          post :delete_dish_from_profile
          get 'show' => 'users#show'
          get :rating_view_image
        end
        resources :images, only: [:update], param: :image_type
        member do
          get  :profile
          post :follow
          post :unfollow
          post :upload_profile_image
          post :upload_cover_image
          get  :followers
          get  :refresh_token
        end
        collection do
          get :profile
          put  :update_password
        end
      end
      get '/users/:key/:value' => 'users#check_uniqueness'

      resources :restaurants, except: [:new, :edit] do
        collection do
          get :suburbs
          get :search
          get :search_by_name
        end
        member do
          post :follow
          post :unfollow
          post :favourite
          post :unfavourite
          get :followers
          get :favouriters
        end
      end

      resources :dishes, except: [:new, :edit] do
        collection do
          get :search_by_name
        end
        member do
          post :favourite
          post :unfavourite
          get :favouriters
        end
        resources :images, only: [:create, :update, :destroy]
        resources :ratings, except: [:new, :edit, :show]  do
          collection do
            put :update_rate
          end
        end
      end
      resources :authentications, only: [:create, :destroy]
      get '/search' => 'dishes#search'
      get '/restaurant_search' => 'dishes#restaurant_search'
      get '/ios_search' => 'dishes#ios_search'
      get '/map_results' => 'dishes#map_results'
      get '/is_active_user' => 'dishes#is_active_user'
      get '/feed' => 'dishes#feed'
      get '/like/:user_id/:image_id' => 'users#like'
      get '/unlike/:user_id/:image_id' => 'users#unlike'
    end
  end
end
