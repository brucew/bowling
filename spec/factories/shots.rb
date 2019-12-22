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

FactoryBot.define do
  factory :shot do
    frame
    score { rand(10) }
  end
end
