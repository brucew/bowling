# == Schema Information
#
# Table name: shots
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  score      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  frame_id   :bigint
#
# Indexes
#
#  index_shots_on_frame_id  (frame_id)
#

class Shot < ApplicationRecord
  belongs_to :frame, inverse_of: :shots
  has_one :game, through: :frame, inverse_of: :shots

  before_validation :set_number, on: :create
  before_validation :set_frame, on: :create

  validates :score,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: :max_score,
              greater_than_or_equal_to: 0,
              message: 'must be a whole number between 0 and 10'
            }

  def max_score
    if frame.number < 10
      10 - (frame.shots.first&.score || 0)
    else
      10
    end
  end

  def score_symbol
    case
    when strike?
      'X'.freeze
    when spare?
      '\\'.freeze
    else
      score.to_s
    end
  end

  def spare?
    self == frame.shots.second && frame.shots_scores_sum == 10
  end

  def strike?
    score == 10
  end

  private

  def set_frame
    self.frame = game.frames.create if frame.full?
  end

  def set_number
    self.number = game.shots.count + 1
  end

end
