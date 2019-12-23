class ShotsController < ApplicationController
  def create
    @shot = Shot.create(shot_params.merge(score: params[:commit]))

    redirect_to game_path(@shot.game)
  end

  private

  def shot_params
    params.require(:shot).permit(:frame_id)
  end

end