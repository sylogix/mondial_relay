# frozen_string_literal: true

RSpec.describe MondialRelay::Translatable do
  describe MondialRelay::DropOffPoints::Search do
    it_behaves_like :translatable
  end

  describe MondialRelay::Labels::Create do
    it_behaves_like :translatable
  end

  describe MondialRelay::Labels::Fetch do
    it_behaves_like :translatable
  end

  describe MondialRelay::Shipments::Create do
    it_behaves_like :translatable
  end

  describe MondialRelay::Shipments::Trace do
    it_behaves_like :translatable
  end
end
