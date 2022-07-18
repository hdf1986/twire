# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    user
    follower { build :user }
  end
end
