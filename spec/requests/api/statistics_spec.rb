require "spec_helper"

RSpec.describe "Statistics", type: :request do
  class User; end
  class Order; end

  subject do
    get "/floodlight/api/statistics/#{stat_name}", params: { access_token: token }
  end

  let(:stat_name) { "orders" }

  before do
    Floodlight.add :daily_users, scope: -> { User }
    Floodlight.add :orders, scope: -> { Order }
    Floodlight.add :total_users, scope: -> { User }, type: 'cumulative'

    allow(User).to receive(:where).
      and_return double("Relation", count: 10)
    allow(Order).to receive(:where).
      and_return double("Relation", count: 15)
  end

  let(:token) { '1234' }

  context 'when API token is correct' do
    stub_access_token!('1234')

    let(:body) { JSON.parse(response.body) }

    let(:stat_name) { "orders" }

    it 'returns success' do
      subject
      expect(response).to have_http_status(200)
    end

    it 'returns value' do
      subject
      expect(body["count"]).to eq(15)
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