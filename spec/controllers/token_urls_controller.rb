# frozen_string_literal: true

require 'rails_helper'

describe TokenUrlsController, type: :controller do
  describe '#index' do
    subject { get :index }

    it 'returns 200' do
      expect(response.code).to eq('200')
    end
  end

  describe '#create' do
    let(:params) do
      {
        token_url:
          {
            url: 'https://test.com',
          }
      }
    end
    let(:invalid_params) do
      {
        token_url:
          {
            url: '',
          }
      }
    end

    context 'with a valid params' do
      it 'creates a record' do
        expect do
          post :create, params: params
        end.to change { TokenUrl.count }.by(1)
      end
    end

    context 'with invalid params' do
      it 'fails when no url' do
        expect do
          post :create, params: invalid_params
        end.to change { TokenUrl.count }.by(0)
      end

      it 'fails when token is already taken' do
        expect do
          post :create, params: params
        end.to change { TokenUrl.count }.by(1)

        expect do
          post :create, params: params
        end.to change { TokenUrl.count }.by(0)
      end
    end
  end

  describe '#show' do
    let(:token_url) { create(:token_url, url: "https://google.com", token: "abcdef") }
    it 'redirects to url if the token exists in the db' do
      token_url.touch
      get :show, params: { token: "abcdef" }
      expect(response).to redirect_to(token_url.url)
    end

    it 'redirects to root url if the token does not exist in the db' do
      token_url.touch
      get :show, params: { token: "fails" }
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#index' do
    let(:token_url) { create(:token_url, url: "https://google.com", token: "abcdef") }
    let(:internet_protocol) { create(:internet_protocol, token_url: token_url)}

    it 'shows all ip address related to this slug' do
      token_url.touch
      get :index, params: { token: "abcdef" }
      expect(response.code).to eq('200')
    end

    it 'redirects to root url if the token does not exist in the db' do
      token_url.touch
      get :show, params: { token: "fails" }
      expect(response).to redirect_to(root_path)
    end
  end
end
