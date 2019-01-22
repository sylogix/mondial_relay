# frozen_string_literal: true

module MondialRelay
  module Labels
    class Create
      module Translations
        PARAMS = {
          collection_mode: :ModeCol,
          delivery_mode: :ModeLiv,
          shipment_reference: :NDossier,

          sender_reference: :NClient,
          sender_language: :Expe_Langage,
          sender_name: :Expe_Ad1,
          sender_name_additional: :Expe_Ad2,
          sender_address: :Expe_Ad3,
          sender_address_additional: :Expe_Ad4,
          sender_city: :Expe_Ville,
          sender_postal_code: :Expe_CP,
          sender_country: :Expe_Pays,
          sender_phone_number: :Expe_Tel1,
          sender_mobile_number: :Expe_Tel2,
          sender_email: :Expe_Mail,

          receiver_language: :Dest_Langage,
          receiver_name: :Dest_Ad1,
          receiver_name_additional: :Dest_Ad2,
          receiver_address: :Dest_Ad3,
          receiver_address_additional: :Dest_Ad4,
          receiver_city: :Dest_Ville,
          receiver_postal_code: :Dest_CP,
          receiver_country: :Dest_Pays,
          receiver_phone_number: :Dest_Tel1,
          receiver_mobile_number: :Dest_Tel2,
          receiver_email: :Dest_Mail,

          parcel_weight: :Poids,
          parcel_length: :Longueur,
          parcel_size: :Taille,
          parcel_count: :NbColis,
          cod_price: :CRT_Valeur,
          cod_price_currency: :CRT_Devise,
          price: :Exp_Valeur,
          currency: :Exp_Devise,

          collection_country: :COL_Rel_Pays,
          collection_parcel_shop_id: :COL_Rel,
          delivery_country: :LIV_Rel_Pays,
          delivery_parcel_shop_id: :LIV_Rel,

          notify: :TAvisage,
          reprise: :TReprise,
          assembly_time: :Montage,
          request_for_delivery_appointment: :TRDV,
          assurance: :Assurance,
          instructions: :Instructions,
          text: :Texte,
        }.freeze

        RESPONSE = {
          expedition_num: :shipment_number,
          url_etiquette: :url_label,
        }.freeze
      end
    end
  end
end
