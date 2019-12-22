require 'rails_helper'

describe Frame do

  describe :full? do
    context 'when not the 10th frame' do
      context 'with no shots' do
        it 'returns false' do
          frame = create(:frame)

          expect(frame.full?).to be false
        end
      end

      context 'with 2 shots, open' do
        it 'returns true' do
          frame = create(:open_frame_with_2_shots)

          expect(frame.full?).to be true
        end
      end

      context 'with 2 shots, spare' do
        it 'returns true' do
          frame = create(:frame_with_spare)

          expect(frame.full?).to be true
        end
      end

      context 'with 1 shot, open' do
        it 'returns false' do
          frame = create(:open_frame_with_1_shot)

          expect(frame.full?).to be false
        end
      end

      context 'with 1 shot, strike' do
        it 'returns true' do
          frame = create(:frame_with_strike)

          expect(frame.full?).to be true
        end
      end

    end
  end

  context 'when the 10th frame' do
    context 'with no shots' do
      it 'returns false' do
        frame = create(:frame)
        frame.number = 10

        expect(frame.full?).to be false
      end
    end

    context 'with 2 shots, open' do
      it 'returns true' do
        frame = create(:open_frame_with_2_shots)
        frame.number = 10

        expect(frame.full?).to be true
      end
    end

    context 'with 2 shots, spare' do
      it 'returns false' do
        frame = create(:frame_with_spare)
        frame.number = 10

        expect(frame.full?).to be false
      end
    end

    context 'with 1 shot, open' do
      it 'returns false' do
        frame = create(:open_frame_with_1_shot)
        frame.number = 10

        expect(frame.full?).to be false
      end
    end

    context 'with 1 shot, strike' do
      it 'returns false' do
        frame = create(:frame_with_strike)
        frame.number = 10

        expect(frame.full?).to be false
      end
    end

    context 'with 1 shot, strike' do
      it 'returns false' do
        frame = create(:frame_with_strike)
        frame.number = 10

        expect(frame.full?).to be false
      end
    end

    context 'with 2 shots, strikes' do
      it 'returns false' do
        frame = create(:frame_with_strike)
        frame.number = 10
        frame.shots << create(:shot, frame: frame, score: 10)

        expect(frame.full?).to be false
      end
    end

    context 'with 3 shots, strikes' do
      it 'returns true' do
        frame = create(:frame_with_strike)
        frame.number = 10
        frame.shots << create_list(:shot, 2, frame: frame, score: 10)

        expect(frame.full?).to be true
      end
    end

  end

end