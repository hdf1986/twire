# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  it { is_expected.to be_valid }

  it { is_expected.to have_many(:follows) }
  it { is_expected.to have_many(:followings).with_foreign_key(:follower_id).class_name(:Follow) }

  it { is_expected.to have_many(:followers).through(:follows) }
  it { is_expected.to have_many(:followed).through(:followings) }

  it { is_expected.to validate_uniqueness_of(:nickname) }
  it { is_expected.to validate_presence_of(:nickname) }
end
