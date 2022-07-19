# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static', type: :request do
  describe 'GET /' do
    context 'with an authenticated user' do
      let(:user) { create :user, :with_following }
      before do
        sign_in user
        get root_path
      end

      it 'returns status ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'without an authenticated user' do
      before { get root_path }

      it 'returns status ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
