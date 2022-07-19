# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    nickname { Faker::Internet.username(separators: %w[_ -]) }
    password { 'examplepassword' }
    password_confirmation { password }

    trait :with_messages do
      after(:create) do |user|
        create_list(:message, 3, user: user)
      end
    end

    trait :with_following do |_user|
      after(:create) do |user|
        3.times do
          u = create :user, :with_messages
          user.followings.create!(user: u)
        end
      end
    end
  end
end
