# frozen_string_literal: true

RSpec.shared_examples :operation do
  subject { described_class.for(params) }

  let(:params) { { param: :param } }
  let(:response) { { response: :response } }

  before do
    if defined?(described_class::FormatParams)
      allow(described_class::FormatParams)
        .to receive(:for).and_return(params)
    end

    if defined?(described_class::FormatResponse)
      allow(described_class::FormatResponse)
        .to receive(:for).and_return(response)
    end

    expect(MondialRelay::Query)
      .to(receive(:run))
      .with(described_class.service_endpoint, Hash)
      .and_return(response)
  end

  it { is_expected.to eq(response) }
end
