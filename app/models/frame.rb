class Frame < ApplicationRecord
  belongs_to :game
  has_many :shots

  validates :shots, length: {maximum: 3, message: 'is too large (maximum is 3 shots)'}
end