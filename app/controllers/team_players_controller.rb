class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    if params[:sorted]
      @players = @team.alphabetical
    elsif params[:age]
      @players = @team.max_age(params[:age])
    else
      @players = @team.players
    end
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

    redirect_to "/teams/#{player.team_id}/players"
  end

  def team_players_params
    params.permit(:team_id, :name, :age, :old_enough)
  end
end