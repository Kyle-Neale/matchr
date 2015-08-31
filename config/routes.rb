Rails.application.routes.draw do

  root to: "home#index"
  resources :users ,except: [:new] do
    member do
    	get 'profile' 
    	get 'matches'
    end
  end

  get 'auth/facebook/callback' ,to: "sessions#create"
end
