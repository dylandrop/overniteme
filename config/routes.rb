Overniteme::Application.routes.draw do
  devise_for :users
  resources :conversations, :only => [:new, :create, :show, :index]
  resources :messages, :only => [:create]
  resources :users, :only => [:index, :show]
  root :to => 'static#home'
end
