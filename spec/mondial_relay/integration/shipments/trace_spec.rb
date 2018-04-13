# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Shipments::Trace, '.for' do
  it_behaves_like :query do
    let(:params) do
      { shipment_number: '20720967' }
    end

    let(:response_keys) do
      %i(last_status drop_off_point_name drop_off_point_id tracing)
    end
  end
end
