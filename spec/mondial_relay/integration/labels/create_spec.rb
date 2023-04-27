# frozen_string_literal: true

RSpec.xdescribe MondialRelay::Labels::Create, '.for' do
  it_behaves_like :query do
    let(:params) do
      {
        sender_name: 'Test Sender',
        sender_address: '38 Route de Rennes',
        sender_city: 'Nantes',
        sender_postal_code: '44300',
        sender_country: 'FR',
        sender_phone_number: '+3300000000',

        receiver_name: 'Test Receiver',
        receiver_address: 'Bouwhandelstraat 94-138',
        receiver_city: 'Antwerpen',
        receiver_postal_code: '2140',
        receiver_country: 'BE',

        parcel_weight: 500,
        collection_country: 'FR',
        collection_parcel_shop_id: '08862',
        delivery_country: 'BE',
        delivery_parcel_shop_id: '40219',
        text: 'hello',
      }
    end

    let(:response_keys) do
      %i(shipment_number url_label)
    end
  end
end
