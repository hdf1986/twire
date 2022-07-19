# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'GET /index' do
    context 'with an authenticated user' do
      let(:user) { create :user, :with_following }
      before do
        sign_in user
        get messages_path
      end

      it 'returns status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'retrieves messages only from followed users' do
        expect(assigns(:messages).map(&:user_id).uniq.sort).to eq(user.followed.ids.sort)
      end
    end

    context 'without an authenticated user' do
      subject { get messages_path }

      it 'redirects to sign in' do
        expect(subject).to redirect_to(new_user_session_path)
      end
    end
  end
end
