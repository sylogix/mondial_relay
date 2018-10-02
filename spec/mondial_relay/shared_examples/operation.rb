# frozen_string_literal: true

RSpec.shared_examples :operation do
  subject { described_class.for(account, params) }

  let(:params) { { param: :param } }
  let(:account) { build(:account) }
  let(:response) { { response: :response } }

  before do
    if defined?(described_class::FormatParams)
      expect(described_class::FormatParams)
        .to receive(:for).and_return(params)
    end

    if defined?(described_class::FormatResponse)
      expect(described_class::FormatResponse)
        .to receive(:for).and_return(response)
    end

    expect(MondialRelay::Query)
      .to(receive(:run))
      .with(
        MondialRelay.services.resolve(described_class.service),
        described_class.operation,
        account,
        Hash,
      ).and_return(response)
  end

  it { is_expected.to eq(response) }
end
