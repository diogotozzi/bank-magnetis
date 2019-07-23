Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'ping#index'

  post '/api/account', to: 'account#create'
  get '/api/account/:id', to: 'account#show'

  post '/api/transfer', to: 'transfer#create'

  get '/api/ping', to: 'ping#index'
end
