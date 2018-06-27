# frozen_string_literal: true

RSpec.describe MondialRelay::Query, '.run' do
  subject { described_class.run(service, operation, params) }

  let(:service) { build(:generic_service) }
  let(:client) { service.client }

  let(:operation) { :test }
  let(:params) { {} }

  let(:response) { double(:response) }
  let(:body) do
    {
      test_response: {
        test_result: {
          stat: '0'
        }
      }
    }
  end

  before do
    stub_request(:get, client.wsdl_url)

    allow(client).to receive(:call).and_return(response)
    allow(response).to receive(:body).and_return(body)
  end

  it 'returns an api response' do
    expect(subject).to eq(stat: '0')
  end
end
