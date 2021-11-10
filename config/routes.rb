Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only:[:create, :index, :show, :edit, :update, :destroy]
  resources :users, only:[:new, :create, :show, :edit, :update]
  resources :homes
end
