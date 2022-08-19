Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only:[:create, :index, :show, :edit, :update, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
end
