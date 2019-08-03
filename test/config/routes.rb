Rails.application.routes.draw do
  devise_for :users, controllers: {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update]


  resources :choices, only: [:new, :create, :edit, :update, :destroy, :index] do
  	resources :contents, only: [:new, :create, :edit, :update, :destroy, :index] do
  		resource :checks, only: [:create, :destroy]
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
