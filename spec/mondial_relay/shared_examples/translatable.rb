# frozen_string_literal: true

RSpec.shared_examples :translatable do
  let(:operation) { described_class.new(params) }

  let(:params) { { nested: data } }
  let(:data) { described_class::Translations::PARAMS }

  describe '#translated_params' do
    subject { operation.translate_params(params) }

    let(:translated_params) do
      { nested: Hash[data.map { |_, val| [val, val] }] }
    end

    it { is_expected.to eq(translated_params) }

    it 'does not mutate an original object' do
      expect { subject }.not_to change { params }
    end
  end

  describe '#translated_response' do
    subject { operation.translate_response(response) }

    let(:data) { described_class::Translations::RESPONSE }

    let(:response) do
      { nested: [data] }
    end

    let(:translated_response) do
      { nested: [Hash[data.map { |_, val| [val, val] }]] }
    end

    it { is_expected.to eq(translated_response) }

    it 'does not mutate an original object' do
      expect { subject }.not_to change { response }
    end
  end
end
