# frozen_string_literal: true

require 'digest'

RSpec.describe MondialRelay::SecurityCode, '.for' do
  subject { described_class.for(params) }

  let(:params) { %w[p1 p2] }

  let(:params_for_digest) do
    [
        MondialRelay::config.merchant_id,
        params.join,
        MondialRelay::config.api_secret
    ].join
  end

  let(:expected_code) { Digest::MD5.hexdigest(params_for_digest).upcase }

  it 'generates a security code' do
    expect(subject).to eq(expected_code)
  end
end
