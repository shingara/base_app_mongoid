BaseApp::Application.routes.draw do
  resources :users, :except => [:new]

  devise_for :users
  root :to => 'users#index'
end
