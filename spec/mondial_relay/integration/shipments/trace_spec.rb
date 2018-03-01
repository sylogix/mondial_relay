# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Shipments::Trace, '.for' do
  it_behaves_like :query do
    let(:params) do
      { Expedition: '31236189', Langue: 'FR' }
    end

    let(:response_keys) do
      %i[libelle_01 libelle_02 tracing]
    end
  end
end
