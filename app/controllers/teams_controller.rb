class TeamsController < ApplicationController
  def index
    # @teams = Team.all
    @teams = Team.ordered
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    tea, = Team.create(team_params)
    # team = Team.create(
    #   name: params[:name],
    #   rank: params[:rank],
    #   qualified: params[:qualified]
    # )
    redirect_to "/teams"
  end

  def team_params
    params.permit(:name, :rank, :qualified)
  end
end