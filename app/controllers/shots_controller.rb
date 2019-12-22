class ShotsController < ApplicationController
  def create
    @shot = Shot.create

    redirect_to game_path(@shot.game)
  end

end