# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { build :message }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to belong_to(:user).required }
end
