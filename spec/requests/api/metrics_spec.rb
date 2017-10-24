require "spec_helper"

RSpec.describe "Metrics", type: :request do
  subject do
    get '/floodlight/api/metrics', params: { access_token: token }
  end

  before do
    Floodlight.add_daily :users, scope: -> { User }
    Floodlight.add_daily :yesterdays_orders, scope: -> { Order.for_yesterday }
  end

  let(:token) { '1234' }

  context 'when API token is correct' do
    stub_access_token!('1234')

    let(:body) { JSON.parse(response.body) }

    it 'returns success' do
      subject
      expect(response).to have_http_status(200)
    end

    it 'includes array of metrics' do
      subject
      expect(body["metrics"]).to eq([['users', 'daily'], ['yesterdays_orders', 'daily']])
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