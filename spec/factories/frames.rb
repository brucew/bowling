FactoryBot.define do
  factory :frame do
    score { rand(30) }

    factory :frame_with_shots do
      transient do
        shots_count { 2 }
      end

      after(:build) do |frame, evaluator|
        build_list(:shot, evaluator.shots_count, frame: frame)
      end

    end

  end
end