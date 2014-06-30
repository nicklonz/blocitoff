Rails.application.routes.draw do

  devise_for :users
  resources :lists do
    resources :items, only: [:create, :destroy]
  end

  get 'welcome/index'

  get 'welcome/about'

  root to:'welcome#index'

end
