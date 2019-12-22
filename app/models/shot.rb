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

  validates :score,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: 10,
              greater_than_or_equal_to: 0,
              message: 'must be a whole number between 0 and 10'
            }

  private

  def set_number
    self.number = game.shots.count + 1
  end

end
