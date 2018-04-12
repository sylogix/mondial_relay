# frozen_string_literal: true

RSpec.describe MondialRelay::Shipments::Trace, '.for' do
  subject { described_class.for(params) }

  let(:params) do
    {
      shipment_number: '31236189',
      language: 'FR',
    }
  end

  let(:query_result) { double(:query_result) }

  before do
    expect(MondialRelay::Query)
      .to(receive(:run))
      .with(described_class::OPERATION, Hash)
      .and_return(query_result)
  end

  it { is_expected.to eq(query_result) }
end
