Overniteme::Application.routes.draw do
  devise_for :users
  resources :conversations, :only => [:new, :create, :show, :index]
  resources :users, :only => [:index, :show]
  root :to => 'static#home'
end
