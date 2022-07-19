# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET /users/:id' do
    context 'with an authenticated user' do
      let(:user) { create :user }
      let(:current_user) { create :user }
      before do
        sign_in current_user
        get user_path(user)
      end

      it 'returns status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'retrieves user' do
        expect(assigns(:user).id).to eq(user.id)
      end
    end

    context 'without an authenticated user' do
      let(:user) { create :user }

      before { get user_path(user) }

      it 'returns status ok' do
        expect(subject).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /users/:id/follow' do
    context 'with an authenticated user' do
      let(:user) { create :user }
      let(:current_user) { create :user }
      before { sign_in current_user }

      subject { patch user_follow_path(user) }

      it 'returns status ok' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it 'creates a follow' do
        expect { subject }.to(
          change { Follow.where(user: user, follower: current_user).count }.by(1)
        )
      end
    end

    context 'without an authenticated user' do
      let(:user) { create :user }

      subject { patch user_follow_path(user) }

      it 'returns status ok' do
        expect(subject).to redirect_to(new_user_session_path)
      end

      it 'does not create a new follow' do
        expect { subject }.not_to(
          change { Follow.count }
        )
      end
    end
  end
end
