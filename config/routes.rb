Rails.application.routes.draw do
  get 'friendships/index'
  get 'friendships/create'
  get 'friendships/destroy'
  get 'friendships/edit'

  resources :friendships
  post 'confirm' => "friendships#confirm"
  get 'received_requests' => "friendships#received_requests"
  get 'sent_requests' => "friendships#sent_requests"
  get "friends" => "friends#index"
  delete "remove_friend" => "friendships#destroy"

  resources :users
  resources :messages do
    collection do
      get :inbox
      get :sent
    end
  end

  get "profile" => "users#edit"

  get 'auth/:provider/callback' => 'sessions#callback'


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
