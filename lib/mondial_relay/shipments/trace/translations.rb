# frozen_string_literal: true

module MondialRelay
  module Shipments
    class Trace
      module Translations
        PARAMS = {
          shipment_number: :Expedition,
          language: :Langue,
        }.freeze

        RESPONSE = {
          libelle01: :last_status,
          relais_libelle: :parcel_shop_name,
          relais_num: :parcel_shop_id,
          libelle02: :last_status_additional,
          ret_wsi2_sub_tracing_colis_detaille: :details,
          libelle: :status,
          heure: :hour,
          emplacement: :location,
          relais_pays: :parcel_shop_country,
        }.freeze
      end
    end
  end
end
