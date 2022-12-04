class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update(player_params)
    # (
    #   name: params[:name],
    #   age: params[:age],
    #   old_enough: params[:old_enough]
    # )
    redirect_to "/players/#{player.id}"
  end

  def player_params 
    params.permit(:name, :age, :old_enough)
  end

end