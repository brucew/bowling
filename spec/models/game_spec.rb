# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Game do

  describe :score do
    context 'with no frames' do
      it 'returns 0' do
        game = build(:game)

        expect(game.score).to eq 0

      end
    end

    context 'with 3 frames, no strikes or spares' do
      it 'returns the sum of the frames scores' do
        game = build(:game)
        game.frames << build(:frame, score: 0)
        game.frames << build(:frame, score: 1)
        game.frames << build(:frame, score: 9)

        expect(game.score).to eq 10

      end
    end

    context 'with 3 frames, all strikes' do
      it 'returns the sum of the frames scores' do
        game = build(:game)
        game.frames << build(:frame, score: 10)
        game.frames << build(:frame, score: 10)
        game.frames << build(:frame, score: 10)

        expect(game.score).to eq 90

      end
    end

  end

end
