BaseApp::Application.routes.draw do
  devise_for :users
  resources :users, :except => [:new]
  root :to => 'users#index'
end
