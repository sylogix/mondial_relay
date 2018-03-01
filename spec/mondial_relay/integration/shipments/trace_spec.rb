# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Shipments::Trace, '.for' do
  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  subject { described_class.for(params) }

  let(:params) do
    {
      Expedition: '31236189',
      Langue: 'FR'
    }
  end

  let(:tracing_keys) do
    %i[libelle_01 libelle_02 tracing]
  end

  # Disable because MR returns a server error (99).
  # Maybe tracking is not supported for test clients?
  xit 'returns a valid response' do
    expect { subject }.not_to raise_error
    expect(subject).to include(*tracing_keys)
  end

  context 'when params are invalid' do
    let(:params) { {} }

    it 'raises an error' do
      expect { subject }.to raise_error(MondialRelay::ResponseError)
    end
  end
end
