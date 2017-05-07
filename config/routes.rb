Rails.application.routes.draw do

  resources :matches
  devise_for :users, path: 'admin'
  get 'welcome/index'
  root 'welcome#index'

  namespace :admin do
    root to: 'dashboard#home', as: :root

    resources :teams
  end

end
