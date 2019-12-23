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
        game = create(:game)

        expect(game.score).to eq 0
      end
    end

    context 'with 3 open frames' do
      it 'returns the sum of the shots scores' do
        game = create(:game, frames: create_list(:open_frame_with_2_shots, 3))

        expected_score = Shot.where(frame: game.frames).sum(:score)
        expect(game.score).to eq expected_score
      end
    end

    context 'with 3 frames, all strikes' do
      it 'returns 60' do
        game = create(:game)
        game.frames << create_list(:frame_with_strike, 3, game: game)

        expect(game.score).to eq 60
      end
    end

    context 'with 2 frames, a spare and then a strike' do
      it 'returns 30' do
        game = create(:game)
        game.frames << create(:frame_with_spare, game: game)
        game.frames << create(:frame_with_strike, game: game)

        expect(game.score).to eq 30
      end
    end

    context 'with 2 frames, a strike and then a spare' do
      it 'returns 30' do
        game = create(:game)
        game.frames << create(:frame_with_strike, game: game)
        game.frames << create(:frame_with_spare, game: game)

        expect(game.score).to eq 30
      end
    end

    context 'with 2 frames, a spare and then a 2' do
      it 'returns 14' do
        game = create(:game)
        game.frames << create(:frame_with_spare, game: game)
        game.frames << create(:frame, game: game)
        last_frame = game.frames.last
        last_frame.shots << create(:shot, frame: last_frame, score: 2)

        expect(game.score).to eq 14
      end
    end

    context 'with 10 frames, all strikes' do
      it 'returns 300' do
        game = create(:game)
        game.frames << create_list(:frame_with_strike, 10, game: game)
        last_frame = game.frames.last
        last_frame.shots << create_list(:shot, 2, frame: last_frame, score: 10)

        expect(game.score).to eq 300
      end
    end

    context 'with 10 frames, all spares with non-spare shots scoring 3' do
      it 'returns 133' do
        game = create(:game)
        last_frame = game.frames.last
        10.times do
          game.frames << create(:frame)
          last_frame = game.frames.last
          last_frame.shots << create(:shot, frame: last_frame, score: 3)
          last_frame.shots << create(:shot, frame: last_frame, score: 7)

        end
        last_frame.shots << create(:shot, frame: last_frame, score: 3)

        expect(game.score).to eq 130
      end
    end

  end

end
