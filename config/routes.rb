Rails.application.routes.draw do

  devise_for :users,  path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { sessions: 'sessions' }

  resources :crops
  resources :areas, path: '/pola'  do
    post '/coords' => "areas#coords", as: 'coords'
    post '/show_modal' => 'areas#show_modal'
  end
  resources :events
  resources :crops

  get 'welcome/index'
  root 'welcome#index'


end
