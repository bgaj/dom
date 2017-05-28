Rails.application.routes.draw do

  devise_for :users,  path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { sessions: 'sessions' }
  resources :crops, path: '/uprawy'
  get 'uprawy/wiele' => "crops#new_many", as: :new_many_crops
  post 'uprawy/wiele' => "crops#create_many", as: :create_many_crops

  resources :areas, path: '/pola'  do
    post '/coords' => "areas#coords", as: 'coords'
    post '/show_modal' => 'areas#show_modal'
  end
  resources :events, path: '/zdarzenia'
  resources :machines, path: '/maszyny'

  get 'welcome/index'
  root 'welcome#index'


end
