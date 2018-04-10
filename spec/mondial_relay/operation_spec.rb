# frozen_string_literal: true

RSpec.describe MondialRelay::Operation, '.for' do
  subject { described_class.for(params) }

  let(:params) { double(:params) }

  it 'raises a NotImplementedError' do
    expect { subject }.to raise_error NotImplementedError
  end
end
