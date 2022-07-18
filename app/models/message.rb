# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user, optional: false

  validates :content, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_prepend_to user
    user.followers.find_each { |u| broadcast_prepend_to u }
  end
end
