Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  resources :stories do
    member do
      get 'upvote', to: 'home#upvote'
      get 'downvote', to: 'home#downvote'
    end
  end
  
end
