# frozen_string_literal: true

RSpec.describe MondialRelay::Response, '.for' do
  subject { described_class.for(operation, params) }

  let(:client) { MondialRelay.client }

  let(:operation) { :test }
  let(:params) { {} }

  let(:response) { double(:response) }
  let(:body) { { test_response: { test_result: 'test' } } }

  before do
    stub_request(:get, MondialRelay.config.api_wsdl_url)

    allow(client).to receive(:call).and_return(response)
    allow(response).to receive(:body).and_return(body)
  end

  it 'returns an api response' do
    expect(subject).to eq('test')
  end
end
