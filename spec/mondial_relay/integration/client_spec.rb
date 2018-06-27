# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Client do
  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  let(:client) do
    build(:client, wsdl_url: MondialRelay::Services::GenericService::WSDL_URL)
  end

  describe '#operations' do
    subject { client.operations }

    it 'returns a list of operations' do
      expect(subject).not_to be_empty
    end
  end
end
