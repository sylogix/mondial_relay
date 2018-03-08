# frozen_string_literal: true

RSpec.describe MondialRelay::DropOffPoints::Search, '.for' do
  subject { described_class.for(params) }

  let(:params) do
    {
      Pays: 'FR',
      Latitude: latitude,
      Longitude: longitude,
      DelaiEnvoi: '0',
      RayonRecherche: '20',
    }
  end

  let(:latitude) { '48.8711706' }
  let(:longitude) { '02.3602504' }

  let (:query_result) do
    {
      points_relais: {
        point_relais_details: drop_off_points,
      },
    }
  end

  let(:drop_off_points) { [double(:drop_off_point)] }

  before do
    expect(MondialRelay::Query)
      .to(receive(:run))
      .with(MondialRelay::DropOffPoints::Search::OPERATION, Hash)
      .and_return(query_result)
  end

  it 'returns a list of drop off points' do
    expect(subject).to eq(drop_off_points)
  end
end
