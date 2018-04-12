# frozen_string_literal: true

RSpec.describe MondialRelay::DropOffPoints::Search, '.for' do
  subject { described_class.for(params) }

  let(:params) do
    {
      country: 'FR',
      latitude: '48.8711706',
      longitude: '02.3602504',
    }
  end

  let(:query_result) do
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
      .with(described_class::OPERATION, Hash)
      .and_return(query_result)
  end

  it { is_expected.to eq(drop_off_points) }
end
