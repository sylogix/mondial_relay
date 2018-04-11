# frozen_string_literal: true

RSpec.describe MondialRelay::DropOffPoints::Search::PreprocessParams, '.for' do
  subject { described_class.for(params) }

  let(:params) do
    {
      Latitude: '40.23',
      Longitude: '2.123349492',
      test: 'test',
    }
  end

  let(:preprocessed) do
    {
      Latitude: '40.2300000',
      Longitude: '02.1233495',
      test: 'test',
    }
  end

  it { is_expected.to eq(preprocessed) }
end
