Rails.application.routes.draw do

  get '/' => 'static#index'
  get '/embed' => 'static#embed'

  get '/convert' => 'convert#test'

end