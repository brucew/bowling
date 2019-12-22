# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  has_many :frames, -> { order(number: :asc) }, inverse_of: :game, dependent: :destroy
  has_many :shots, -> { order(number: :asc) }, through: :frames, inverse_of: :game

  validates :frames, length: {maximum: 10, message: 'is too large (maximum is 10 frames)'}

  def complete?
    frames.count == 10 and frames.last.full?
  end

  def score
    frames.map(&:score).sum
  end

end