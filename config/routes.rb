Rails.application.routes.draw do
  devise_for :users
  get 'protospace/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "protospace#index"
  resources :protospace, only: [:index, :new, :create]
end
