Rails.application.routes.draw do
  get 'events/new'
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only:[:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  resources :users, only:[:index, :show, :edit, :update]
  resources :groups, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :events, only:[:new, :create]
    get 'events/complete' => 'events#complete'
    resource :group_users, only: [:create, :destroy]
  end
end
