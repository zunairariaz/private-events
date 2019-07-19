Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/attendent', to: 'events#show'
  post '/attend', to: 'events#attend', as: 'attend'

resources :users
resources :events 

end
#do
#post :attend, on: :member 
#end
