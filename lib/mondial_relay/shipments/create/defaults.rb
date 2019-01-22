# frozen_string_literal: true

module MondialRelay
  module Shipments
    class Create
      module Defaults
        PARAMS = {
          collection_mode: 'REL',
          delivery_mode: '24R',
          shipment_reference: nil,

          sender_reference: nil,
          sender_language: 'FR',
          sender_name: nil,
          sender_name_additional: nil,
          sender_address: nil,
          sender_address_additional: nil,
          sender_city: nil,
          sender_postal_code: nil,
          sender_country: nil,
          sender_phone_number: nil,
          sender_mobile_number: nil,
          sender_email: nil,

          receiver_language: 'FR',
          receiver_name: nil,
          receiver_name_additional: nil,
          receiver_address: nil,
          receiver_address_additional: nil,
          receiver_city: nil,
          receiver_postal_code: nil,
          receiver_country: nil,
          receiver_phone_number: nil,
          receiver_mobile_number: nil,
          receiver_email: nil,

          parcel_weight: nil,
          parcel_length: nil,
          parcel_size: nil,
          parcel_count: 1,
          cod_price: 0,
          cod_price_currency: nil,
          price: nil,
          currency: nil,

          collection_country: nil,
          collection_parcel_shop_id: nil,
          delivery_country: nil,
          delivery_parcel_shop_id: nil,

          notify: nil,
          reprise: nil,
          assembly_time: nil,
          request_for_delivery_appointment: nil,
          assurance: nil,
          instructions: nil,
          text: nil,
        }.freeze
      end
    end
  end
end
