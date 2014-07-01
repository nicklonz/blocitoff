Blocitoff::Application.routes.draw do

  devise_for :users
  resources :lists do
    resources :items, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
