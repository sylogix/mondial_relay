# frozen_string_literal: true

RSpec.describe MondialRelay::Services::DropOffPointsService do
  it_behaves_like :service do
    let(:service) { build(:drop_off_points_service) }
  end
end
