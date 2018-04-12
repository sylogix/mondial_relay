# frozen_string_literal: true

RSpec.shared_examples :translatable do
  let(:params) { described_class::Translations::PARAMS }

  let(:translated_params) do
    Hash[params.map { |_, val| [val, val] }]
  end

  describe '#translated_params' do
    subject { described_class.new(params).translated_params }

    it { is_expected.to eq(translated_params) }
  end
end
