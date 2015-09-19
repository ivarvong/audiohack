Rails.application.routes.draw do

  resources :users

  resources :clips

  resources :episodes

  resources :shows

  get '/' => 'static#index'
  get '/embed' => 'static#embed'

  get '/convert' => 'convert#test'

end