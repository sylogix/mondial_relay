# frozen_string_literal: true

RSpec.shared_examples :service do
  describe '#client' do
    subject { service.client }

    before { allow(service).to receive(:wsdl_url) }

    it 'creates a client' do
      expect(MondialRelay::Client)
        .to receive(:new)
        .with(service.wsdl_url)
        .once

      subject
    end
  end

  describe '#wsdl_url' do
    subject { service.wsdl_url }

    it 'implements a wsdl_url' do
      expect { subject }.not_to raise_error
    end
  end
end
