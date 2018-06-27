# frozen_string_literal: true

RSpec.describe MondialRelay::Services do
  describe '.build' do
    subject { described_class.build(service_name) }

    # TODO: Add a spec for valid servers when they are added

    context 'with an invalid service name' do
      let(:service_name) { :invalid }

      it 'it raises an error' do
        expect { subject }.to raise_error MondialRelay::InvalidServiceError
      end
    end
  end
end
