Rails.application.routes.draw do

  get  '/convert/:clip_id' => 'convert#perform', as: :convert
  get  '/process' => 'convert#process', as: :process

  resources :users

  resources :clips

  resources :episodes

  resources :shows

  root 'episodes#index'
  
  get '/embed' => 'static#embed'

  get '/proxy' => 'static#proxy', as: :proxy

end