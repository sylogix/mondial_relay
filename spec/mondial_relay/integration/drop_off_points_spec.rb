# frozen_string_literal: true

RSpec.xdescribe MondialRelay::DropOffPoints, '.search' do
  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  let(:client) { build(:client) }

  subject { described_class.search(params) }

  let(:params) do
    {
      Pays: 'FR',
      NumPointRelais: '',
      Ville: '',
      CP: '75010',
      Latitude: '',
      Longitude: '',
      Taille: '',
      Poids: '',
      Action: '',
      DelaiEnvoi: '0',
      RayonRecherche: '20',
      TypeActivite: '',
      NACE: '',
    }
  end

  let(:drop_off_point_keys) do
    %i[num cp pays latitude longitude]
  end

  let(:drop_off_point_details) do
    subject[:points_relais][:point_relais_details]
  end

  it 'returns a response' do
    expect(subject[:stat]).to eq('0')
    expect(drop_off_point_details).to be_a(Array)
    expect(drop_off_point_details.first).to include(*drop_off_point_keys)
  end
end
