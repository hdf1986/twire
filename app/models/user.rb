# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Intermediate tables
  has_many :follows
  has_many :followings, foreign_key: :follower_id, class_name: :Follow

  # User relations
  has_many :followers, through: :follows
  has_many :followed, through: :followings, source: :follower
end
