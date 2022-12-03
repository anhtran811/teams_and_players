Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id', to: 'teams#show'
  get '/player_table_name', to: 'players#index'
  get '/player_table_name/:id', to: 'players#show'
  get '/teams/:team_id/player_table_name', to: 'team_players#index'
  post '/teams', to: 'teams#create'
end
