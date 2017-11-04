Rails.application.routes.draw do

  devise_for :users,  path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { sessions: 'sessions' }
  get 'uprawy/wiele' => "crops#new_many", as: :new_many_crops
  post 'uprawy/wiele' => "crops#create_many", as: :create_many_crops
  post 'uprawy/wiele_a' => "crops#create_with_areas", as: :create_with_areas
  post 'uprawy/add_variant' => "crops#add_variant", as: :crops_create_variant
  post 'uprawy/load_variant' => "crops#load_variant", as: :crops_load_variant
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
  resources :throws, path: '/swinie'
  resources :sales, path: '/sprzedaz', except: [:edit, :update]
  resources :base_forages, path: '/pasze', only: [:new, :create, :destroy]
  resources :template_forages, path: '/pasze-szablon', only: [:create, :update, :edit, :destroy]
  resources :invoices, path: '/faktury'
  get '/pasze/load_temp_throw' => 'base_forages#load_temp_throw', as: :base_forages_load_temp_throw
  get '/pasze/load_template/:temp_id' => 'base_forages#load_template', as: :base_forages_load_template

  get 'welcome/index'
  root 'areas#index'


end
