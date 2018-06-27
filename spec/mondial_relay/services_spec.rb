# frozen_string_literal: true

RSpec.describe MondialRelay::Services do
  describe '.build' do
    subject { described_class.build(service_name) }

    context 'with a valid service name' do
      let(:service_name) { :generic }

      it 'it does not raise an error' do
        expect { subject }.not_to raise_error
      end
    end

    context 'with an invalid service name' do
      let(:service_name) { :invalid }

      it 'it raises an error' do
        expect { subject }.to raise_error MondialRelay::InvalidServiceError
      end
    end
  end
end
