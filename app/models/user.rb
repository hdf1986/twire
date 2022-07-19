# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  # Intermediate tables
  has_many :follows
  has_many :followings, foreign_key: :follower_id, class_name: :Follow

  # User relations
  has_many :followers, through: :follows
  has_many :followed, through: :followings, source: :user
  has_many :messages,  -> { order(created_at: :desc) }, dependent: :destroy

  validates :nickname, uniqueness: true, presence: true

  def follows?(user_id)
    followings.where(user_id: user_id).any?
  end

  def to_param
    nickname.to_s
  end
end
