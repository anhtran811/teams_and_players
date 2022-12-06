class PlayersController < ApplicationController
  def index
    @players = Player.only_true
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
    redirect_to "/players/#{player.id}"
    end
    
  def destroy
    player = Player.find(params[:id])
    player.destroy
    redirect_to '/players'
  end

  def player_params 
    params.permit(:name, :age, :old_enough)
  end

end