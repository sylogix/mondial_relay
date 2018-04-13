# frozen_string_literal: true

require 'digest'

RSpec.describe MondialRelay::SecurityCode, '.for' do
  subject { described_class.for(operation, params) }

  let(:operation) { :wsi2_creation_etiquette }
  let(:params) { { test: 'test', Texte: 'text' } }

  let(:params_for_digest) do
    [
      MondialRelay.config.merchant_id,
      params.except(:Texte).values.join,
      MondialRelay.config.api_secret,
    ].join.encode('windows-1252')
  end

  let(:expected_code) { Digest::MD5.hexdigest(params_for_digest).upcase }

  it 'generates a security code' do
    expect(subject).to eq(expected_code)
  end

  context 'with latin symbols' do
    let(:params) { { test: 'ùûüÿ€àâæçéèêëïîôœÙÛÜŸ€ÀÂÆÇÉÈÊËÏÎÔŒ—–»«”“’' } }

    it 'generates a security code' do
      expect(subject).to eq(expected_code)
    end
  end
end
