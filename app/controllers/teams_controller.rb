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
    team = Team.create(team_params)
    # team = Team.create(
    #   name: params[:name],
    #   rank: params[:rank],
    #   qualified: params[:qualified]
    # )
    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to '/teams'
  end

  private
    def team_params
      params.permit(:name, :rank, :qualified)
    end

end