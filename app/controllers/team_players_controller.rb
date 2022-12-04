class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    player = Player.create(team_players_params)
    #   player = Player.create(
    #   team_id: params[:team_id],
    #   name: params[:name],
    #   age: params[:age],
    #   old_enough: params[:old_enough])

    redirect_to "/teams/#{player.team_id}/player_table_name"
  end

  def team_players_params
    params.permit(:team_id, :name, :age, :old_enough)
  end
end