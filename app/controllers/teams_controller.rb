class TeamsController < ApplicationController
  def index
    # @teams = Team.all
    @teams = Team.ordered
  end

  def show
    @team = Team.find(params[:id])
  end
end