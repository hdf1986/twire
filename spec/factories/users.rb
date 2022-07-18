# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'examplepassword' }
    password_confirmation { password }
  end
end
