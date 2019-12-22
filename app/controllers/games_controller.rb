class GamesController < ApplicationController
  def index
    @games = Game.includes(:frames, :shots).all.order(created_at: :desc)

  end

  def show
    @game = Game.includes(:frames, :shots).find(params[:id])

  end

  def create
    @game = Game.create
    @game.frames.create

    redirect_to game_path(@game)
  end

end