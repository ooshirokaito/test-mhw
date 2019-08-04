Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update, :destroy]
  resources :choices, only: [:new, :create, :index, :edit, :update, :destroy] do
  	resources :contents, only: [:new, :create, :index, :edit, :update, :destroy] do
  	  resources :checks, only: [:create, :destroy]
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
