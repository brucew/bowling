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

          frame.reload
          expect(frame.full?).to be true
        end
      end

      context 'with 2 shots, spare' do
        it 'returns true' do
          frame = create(:frame_with_spare)

          frame.reload
          expect(frame.full?).to be true
        end
      end

      context 'with 1 shot, open' do
        it 'returns false' do
          frame = create(:open_frame_with_1_shot)

          frame.reload
          expect(frame.full?).to be false
        end
      end

      context 'with 1 shot, strike' do
        it 'returns true' do
          frame = create(:frame_with_strike)

          frame.reload
          expect(frame.full?).to be true
        end
      end

    end
  end

  context 'when the 10th frame' do
    context 'with no shots' do
      it 'returns false' do
        frame = create(:frame)

        expect(frame.full?).to be false
      end
    end

    context 'with 2 shots, open' do
      it 'returns true' do
        frame = create(:open_frame_with_2_shots)
        frame.number = 10

        frame.reload
        expect(frame.full?).to be true
      end
    end

    context 'with 2 shots, spare' do
      it 'returns false' do
        frame = create(:frame_with_spare)
        frame.update(number: 10)

        frame.reload
        expect(frame.full?).to be false
      end
    end

    context 'with 1 shot, open' do
      it 'returns false' do
        frame = create(:open_frame_with_1_shot)
        frame.update(number: 10)

        frame.reload
        expect(frame.full?).to be false
      end
    end

    context 'with 1 shot, strike' do
      it 'returns false' do
        frame = create(:frame_with_strike)
        frame.update(number: 10)

        frame.reload
        expect(frame.full?).to be false
      end
    end

    context 'with 1 shot, strike' do
      it 'returns false' do
        frame = create(:frame_with_strike)
        frame.update(number: 10)

        frame.reload
        expect(frame.full?).to be false
      end
    end

    context 'with 2 shots, strikes' do
      it 'returns false' do
        frame = create(:frame_with_strike)
        frame.update(number: 10)
        frame.reload
        create(:shot, frame: frame, score: 10)

        frame.reload
        expect(frame.full?).to be false
      end
    end

    context 'with 3 shots, strikes' do
      it 'returns true' do
        frame = create(:frame_with_strike)
        frame.update(number: 10)
        frame.reload
        create(:shot, frame: frame, score: 10)
        create(:shot, frame: frame, score: 10)

        frame.reload
        expect(frame.full?).to be true
      end
    end

  end

end