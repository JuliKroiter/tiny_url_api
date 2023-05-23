require 'rails_helper'

RSpec.describe TinyUrlsController, type: :controller do
  describe 'POST #create' do
    subject(:request) { post :create, params:, as: :json }

    context 'with valid params' do
      let(:params) { { tiny_url: { url: 'LongUrl' } } }
      let(:success_response) do
        { short_url: Rails.application.routes.url_helpers.tiny_url_url(id: TinyUrl.last.short_url) }
      end

      before do
        request
      end

      it 'is check response status' do
        expect(response.status).to eq(200)
      end

      it 'is check response body' do
        expect(response.body).to eq(success_response.to_json)
      end
    end

    context 'with invalid params' do
      let(:params) { { tiny_url: { invalid_attr: '' } } }
      let(:failure_response) { { errors: 'Url blank' } }

      before do
        request
      end

      it 'is check response status' do
        expect(response.status).to eq(200)
      end

      it 'is check response body' do
        expect(response.body).to eq(failure_response.to_json)
      end
    end
  end

  describe 'GET #show' do
    subject(:request) { get :show, params:, as: :json }

    let(:tiny_url) { create :tiny_url }

    before do
      tiny_url
      request
    end

    context 'when tiny_url founded' do
      let(:params) { { id: tiny_url.short_url } }
      let(:success_response) { { url: tiny_url.url } }

      it 'is check response status' do
        expect(response.status).to eq(200)
      end

      it 'is check response body' do
        expect(response.body).to eq(success_response.to_json)
      end
    end

    context 'when tiny_url not found' do
      let(:params) { { id: 'other_short_url' } }
      let(:failure_response) { { errors: "Url #{params[:id]} not found" } }

      it 'is check response status' do
        expect(response.status).to eq(404)
      end

      it 'is check response body' do
        expect(response.body).to eq(failure_response.to_json)
      end
    end
  end

  describe 'GET #stats' do
    subject(:request) { get :stats, params:, as: :json }

    let(:tiny_url) { create :tiny_url }

    before do
      tiny_url
      request
    end

    context 'when tiny_url founded' do
      let(:params) { { id: tiny_url.short_url } }
      let(:success_response) { { clicked: tiny_url.clicked } }

      it 'is check response status' do
        expect(response.status).to eq(200)
      end

      it 'is check response body' do
        expect(response.body).to eq(success_response.to_json)
      end
    end
  end
end
