# frozen_string_literal: true

RSpec.describe MondialRelay::DropOffPoints::Search::PreprocessParams, '.for' do
  subject { described_class.for(params) }

  let(:params) do
    {
      latitude: '40.23',
      longitude: '2.123349492',
      test: 'test',
    }
  end

  let(:preprocessed) do
    {
      latitude: '40.2300000',
      longitude: '02.1233495',
      test: 'test',
    }
  end

  it { is_expected.to eq(preprocessed) }
end
