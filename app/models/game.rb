class Game < ApplicationRecord
  has_many :frames

  validates :frames, length: {maximum: 10, message: 'is too large (maximum is 10 frames)'}

  def score
    frames.map(&:score).sum
  end

end