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

FactoryBot.define do
  factory :frame do
    game

    factory :open_frame_with_1_shot do
      after(:create) do |frame, evaluator|
        frame.shots << create(:shot, frame: frame, score: rand(9))
      end

    end

    factory :open_frame_with_2_shots do
      after(:create) do |frame, evaluator|
        score1 = rand(9)
        frame.shots << create(:shot, frame: frame, score: score1)
        frame.shots << create(:shot, frame: frame, score: rand(score1..9) - score1)
      end

    end

    factory :frame_with_strike do
      after(:create) do |frame, evaluator|
        frame.shots << create(:shot, frame: frame, score: 10)
      end

    end

    factory :frame_with_spare do
      after(:create) do |frame, evaluator|
        score1 = rand(10)
        frame.shots << create(:shot, frame: frame, score: score1)
        frame.shots << create(:shot, frame: frame, score: 10 - score1)
      end

    end

  end
end
