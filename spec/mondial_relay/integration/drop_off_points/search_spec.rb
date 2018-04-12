# frozen_string_literal: true

RSpec.xdescribe MondialRelay::DropOffPoints::Search, '.for' do
  it_behaves_like :query do
    let(:params) do
      {
        country: 'FR',
        postal_code: '75010',
        latitude: '48.8711706',
        longitude: '02.3602504',
        lead_time: 0,
        search_radius: 20,
        number_of_results: 2,
      }
    end

    let(:response_keys) do
      %i[id postal_code country latitude longitude]
    end
  end
end
