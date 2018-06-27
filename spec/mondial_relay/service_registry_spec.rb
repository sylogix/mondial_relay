# frozen_string_literal: true

RSpec.describe MondialRelay::ServiceRegistry do
  let(:service_registry) { build(:service_registry) }
  let(:service) { build(:generic_service) }

  it 'registers and resolves a service' do
    service_registry.register(service)
    expect(service_registry.resolve(service.name)).to eq(service)
  end
end
