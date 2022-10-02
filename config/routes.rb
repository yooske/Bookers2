Rails.application.routes.draw do
  get 'chats/show'
  get 'event_notices/new'
  get 'event_notices/sent'
  get 'events/new'
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only:[:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  resources :users, only:[:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :groups, only:[:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only:[:new, :create]
    get "event_notices" => "event_notices#sent"
  end
  resources :chats, only: [:show, :create]
end
