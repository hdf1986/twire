# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Follow, type: :model do
  subject { build :follow }

  it { is_expected.to be_valid }

  it { is_expected.to belong_to(:user).required }
  it { is_expected.to belong_to(:follower).required }
end
