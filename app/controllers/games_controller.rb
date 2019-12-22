class GamesController < ApplicationController
  def index
    @games = Game.includes(:frames, :shots).all.order(created_at: :desc)
  end
end