# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Labels::Create, '.for' do
  it_behaves_like :query do
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

    let(:response_keys) do
      %i[expedition_num url_etiquette]
    end
  end
end
