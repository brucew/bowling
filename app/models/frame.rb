# == Schema Information
#
# Table name: frames
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :bigint
#
# Indexes
#
#  index_frames_on_game_id  (game_id)
#

class Frame < ApplicationRecord
  belongs_to :game, inverse_of: :frames
  has_many :shots, -> { order(number: :asc) }, inverse_of: :frame, dependent: :destroy

  before_validation :set_number, on: :create

  validates :number,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: 10,
              greater_than_or_equal_to: 1,
              message: 'must be a whole number between 1 and 10'
            }
  validates :shots, length: {maximum: 3, message: 'is too large (maximum is 3 shots)'}

  def open?
    shots_scores_sum < 10
  end

  def next_shot
    game.shots[self.shots.last.number]
  end

  def shot_after_next
    game.shots[self.shots.last.number + 1]
  end

  def score
    case
    when spare?
      bonus = next_shot&.score || 0
    when strike?
      bonus = (next_shot&.score || 0) + (shot_after_next&.score || 0)
    else
      bonus = 0
    end

    shots_scores_sum + bonus
  end

  def shots_scores_sum
    shots.map(&:score).sum
  end

  def spare?
    !strike? && (shots_scores_sum == 10)
  end

  def strike?
    shots&.first&.score == 10
  end

  private

  def set_number
    self.number = game.frames.count + 1
  end

end
