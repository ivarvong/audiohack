Rails.application.routes.draw do

  get 'static/index'

  get 'static/embed'

  get '/' => 'static#index'
  get '/embed' => 'static#embed'

end