# frozen_string_literal: true

RSpec.describe MondialRelay::Services::ParcelShopsService do
  it_behaves_like :service do
    let(:service) { build(:parcel_shops_service) }
  end
end
