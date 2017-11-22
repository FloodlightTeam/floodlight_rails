require "spec_helper"

RSpec.describe "Health check", type: :request do
  subject do
    get '/meerstats/api/health_check', params: { access_token: token }
  end

  let(:token) { '1234' }

  context 'when API token is correct' do
    stub_access_token!('1234')

    it 'returns success' do
      subject
      expect(response).to have_http_status(200)
    end
  end

  context 'when API token is missing or incorrect' do
    stub_access_token!('4321')

    it 'returns failure' do
      subject
      expect(response).to have_http_status(401)
    end
  end
end