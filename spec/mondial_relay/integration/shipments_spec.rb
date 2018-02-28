# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Shipments, '.create' do
  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  subject { described_class.create(params) }

  let(:params) do
    {
        ModeCol: 'REL',
        ModeLiv: '24R',

        Expe_Langage: 'FR',
        Expe_Ad1: 'Test Sender',
        Expe_Ad3: '38 Route de Rennes',
        Expe_Ville: 'Nantes',
        Expe_CP: '44300',
        Expe_Pays: 'FR',
        Expe_Tel1: '+3300000000',

        Dest_Langage: 'FR',
        Dest_Ad1: 'Test Consignee',
        Dest_Ad3: 'Bouwhandelstraat 94-138',
        Dest_Ville: 'Antwerpen',
        Dest_CP: '2140',
        Dest_Pays: 'BE',

        Poids: '500',
        NbColis: '1',
        CRT_Valeur: '30',

        COL_Rel_Pays: 'FR',
        COL_Rel: '094170',

        LIV_Rel_Pays: 'BE',
        LIV_Rel: '006515',
    }
  end

  let(:shipment_keys) do
    %i[expedition_num tri_agence_code tri_agence]
  end

  it 'returns a valid response' do
    expect { subject }.not_to raise_error
    expect(subject).to include(*shipment_keys)
  end

  context 'when params are invalid' do
    let(:params) { {} }

    it 'raises an error' do
      expect { subject }.to raise_error(MondialRelay::ResponseError)
    end
  end
end
