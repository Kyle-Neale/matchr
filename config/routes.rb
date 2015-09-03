Rails.application.routes.draw do

  root to: "home#index"
  resources :users ,except: [:new] do
    member do
    	get 'profile' 
    	get 'matches'
    end
  end
  match "sign_out", to: "sessions#destroy" ,via: 'delete'
  get 'auth/facebook/callback' ,to: "sessions#create"

  post 'create_friendship' => 'friendships#create'

  delete 'delete_friendship' => 'friendships#destroy'
end
