Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/account', to: 'account#create'
  get '/account/:id', to: 'account#show'
  post '/transfer', to: 'transfer#create'

end
