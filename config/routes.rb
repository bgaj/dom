Rails.application.routes.draw do

  resources :areas, path: '/pola'  do
    post '/coords' => "areas#coords", as: 'coords'
    post '/show_modal' => 'areas#show_modal'
  end
  devise_for :users, path: 'admin'
  get 'welcome/index'
  root 'welcome#index'

  namespace :admin do
    root to: 'dashboard#home', as: :root
  end

end
