class Game < ApplicationRecord
  has_many :frames

  validates :frames, length: {maximum: 10, message: 'is too large (maximum is 10 frames)'}
end