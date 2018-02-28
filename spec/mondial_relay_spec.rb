# frozen_string_literal: true

RSpec.describe MondialRelay do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  let(:api_url) { 'test' }
  before { MondialRelay.config.api_url = api_url }

  describe '.config' do
    subject { described_class.config }

    it 'returns a configuration' do
      expect(subject).to be_a(MondialRelay::Configuration)
      expect(subject.api_url).to eq(api_url)
    end
  end

  describe '.reset' do
    subject { described_class.reset }

    it 'resets a configuration' do
      expect(subject.api_url).to be_nil
    end
  end

  describe '.configure' do
    subject do
      described_class.configure do |config|
        config.api_url = api_url
      end
    end

    let(:api_url) { 'new' }

    it 'allows to set configuration' do
      expect(subject.api_url).to eq(api_url)
    end

    context 'when configuration is missing' do
      let(:api_url) { nil }

      it 'raises an error' do
        expect {subject}.to raise_error(ArgumentError)
      end
    end
  end
end