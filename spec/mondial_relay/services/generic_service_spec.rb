# frozen_string_literal: true

RSpec.describe MondialRelay::Services::GenericService do
  it_behaves_like :service do
    let(:service) { build(:generic_service) }
  end
end
