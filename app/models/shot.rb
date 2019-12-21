class Shot < ApplicationRecord
  belongs_to :frame

  validates :score,
            numericality: {
              only_integer: true,
              less_than_or_equal_to: 10,
              greater_than_or_equal_to: 0,
              message: 'must be a whole number between 0 and 10'
            }
end