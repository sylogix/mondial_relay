# frozen_string_literal: true

RSpec.describe MondialRelay::Labels::Create, '.for' do
  subject { described_class.for(params) }

  let(:params) do
    {
      sender_name: 'Test Sender',
      sender_address: 'Test street',
      sender_city: 'Paris',
      sender_postal_code: '75011',
      sender_country: 'FR',
      receiver_name: 'Test Receiver',
      receiver_address: 'Test Street 2',
      receiver_city: 'Bordeaux',
      receiver_postal_code: '33000',
      receiver_country: 'FR',
      parcel_weight: 500,
      parcel_length: 20,
      parcel_count: 1,
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
