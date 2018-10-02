# frozen_string_literal: true

RSpec.shared_examples :query do
  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  subject { described_class.for(account, params) }

  let(:account) { build(:account) }

  it 'returns a valid response' do
    expect { subject }.not_to raise_error

    if subject.is_a?(Array)
      expect(subject.first).to include(*response_keys)
    else
      expect(subject).to include(*response_keys)
    end
  end

  context 'when params are invalid' do
    let(:params) { {} }

    it 'raises an error' do
      expect { subject }.to raise_error(MondialRelay::ResponseError)
    end
  end
end
