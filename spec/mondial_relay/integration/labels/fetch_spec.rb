# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Labels::Fetch, '.for' do
  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  subject { described_class.for(params) }

  let(:params) do
    {
      Expeditions: '31236189',
      Langue: 'FR'
    }
  end

  let(:label_keys) do
    %i[url_pdf_a4 url_pdf_a5 url_pdf_10x15]
  end

  it 'returns a valid response' do
    expect { subject }.not_to raise_error
    expect(subject).to include(*label_keys)
  end

  context 'when params are invalid' do
    let(:params) { {} }

    it 'raises an error' do
      expect { subject }.to raise_error(MondialRelay::ResponseError)
    end
  end
end
