# frozen_string_literal: true

RSpec.describe MondialRelay::Configuration, '#validate!' do
  RSpec.shared_examples :argument_error do
    it 'raises an exception' do
      expect { subject.validate! }.to raise_error(ArgumentError)
    end
  end

  it 'has a valid test configuration' do
    expect { MondialRelay.config.validate! }.not_to raise_error
  end

  context 'when api_wsdl_url is missing' do
    before { MondialRelay.config.api_wsdl_url = nil }
    it_behaves_like :argument_error
  end

  context 'when api_url is missing' do
    before { MondialRelay.config.api_url = nil }
    it_behaves_like :argument_error
  end

  context 'when merchant_id is missing' do
    before { MondialRelay.config.merchant_id = nil }
    it_behaves_like :argument_error
  end

  context 'when api_secret is missing' do
    before { MondialRelay.config.api_secret = nil }
    it_behaves_like :argument_error
  end
end
