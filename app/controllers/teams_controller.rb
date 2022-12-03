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
    team = Team.create(name: params[:name])
    redirect_to "/teams"
  end
end