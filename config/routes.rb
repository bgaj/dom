Rails.application.routes.draw do

  devise_for :users,  path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { sessions: 'sessions' }
  get 'uprawy/wiele' => "crops#new_many", as: :new_many_crops
  post 'uprawy/wiele' => "crops#create_many", as: :create_many_crops
  post 'uprawy/wiele_a' => "crops#create_with_areas", as: :create_with_areas
  resources :crops, path: '/uprawy'

  resources :areas, path: '/pola'  do
    post '/coords' => "areas#coords", as: 'coords'
    post '/show_modal' => 'areas#show_modal'
  end
  post '/areas_add_event' => 'areas#areas_add_event', as: :areas_add_event
  post '/areas_add_crops' => 'areas#areas_add_crops', as: :areas_add_crops
  resources :events, path: '/zdarzenia'
  post 'zdarzenia/nowe_a' => "events#new_with_areas", as: :new_with_areas

  resources :machines, path: '/maszyny'

  get 'welcome/index'
  root 'areas#index'


end
