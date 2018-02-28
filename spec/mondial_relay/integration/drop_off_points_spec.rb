# frozen_string_literal: true

RSpec.xdescribe MondialRelay::DropOffPoints, '.search' do
  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  let(:client) { build(:client) }

  subject { described_class.search(params) }

  let(:params) do
    {
      Pays: 'FR',
      CP: '75010',
      Latitude: '48.8711706',
      Longitude: '02.3602504',
      DelaiEnvoi: '0',
      RayonRecherche: '20',
    }
  end

  let(:drop_off_point_keys) do
    %i[num cp pays latitude longitude]
  end

  it 'returns a valid response' do
    expect { subject }.not_to raise_error

    expect(subject).to be_a(Array)
    expect(subject.first).to include(*drop_off_point_keys)
  end

  context 'when params are invalid' do
    let(:params) { {} }

    it 'raises an error' do
      expect { subject }.to raise_error(MondialRelay::ResponseError)
    end
  end
end
