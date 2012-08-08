Overniteme::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:index]
  root :to => 'static#home'
end
