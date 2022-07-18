# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user, optional: false

  validates :content, presence: true
end
