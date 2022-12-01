Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
  get '/player_table_name', to: 'players#index'
  get '/player_table_name/:id', to: 'players#show'
end
