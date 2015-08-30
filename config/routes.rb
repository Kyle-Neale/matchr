Rails.application.routes.draw do
  get 'users/index'

  get 'users/edit'

  get 'users/matches'

  get 'users/profile'


  root to: "home#index"
end
