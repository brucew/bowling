# == Schema Information
#
# Table name: frames
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  score      :integer
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

    factory :frame_with_shots do
      transient do
        shots_count { 2 }
      end

      after(:create) do |frame, evaluator|
        create_list(:shot, evaluator.shots_count, frame: frame)
      end

    end

    factory :frame_with_strike do
      after(:create) do |frame, evaluator|
        create(:shot, frame: frame, score: 10)
      end

    end

    factory :frame_with_spare do
      after(:create) do |frame, evaluator|
        score1 = rand(10)
        create(:shot, frame: frame, score: score1)
        create(:shot, frame: frame, score: 10 - score1)
      end

    end

    factory :open_frame do
      after(:create) do |frame, evaluator|
        score1 = rand(9)
        create(:shot, frame: frame, score: score1)
        create(:shot, frame: frame, score: rand(score1..9) - score1)
      end

    end

  end
end
