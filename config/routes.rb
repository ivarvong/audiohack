Rails.application.routes.draw do

  get '/convert/:clip_id' => 'convert#perform', as: :convert

  resources :users

  resources :clips

  resources :episodes

  resources :shows

  get '/' => 'static#index'
  get '/embed' => 'static#embed'


end