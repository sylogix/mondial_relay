# frozen_string_literal: true

RSpec.xdescribe MondialRelay::DropOffPoints::Search, '.for' do
  it_behaves_like :query do
    let(:params) do
      {
        Pays: 'FR',
        CP: '75010',
        Latitude: '48.8711706',
        Longitude: '02.3602504',
        DelaiEnvoi: '0',
        RayonRecherche: '20',
      }
    end

    let(:response_keys) do
      %i[num cp pays latitude longitude]
    end
  end
end
