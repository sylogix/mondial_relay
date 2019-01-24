# frozen_string_literal: true

module MondialRelay
  module ParcelShops
    class Search
      module Defaults
        PARAMS = {
          country: nil,
          parcel_shop_id: nil,
          city: nil,
          postal_code: nil,
          latitude: nil,
          longitude: nil,
          parcel_size: nil,
          parcel_weight: nil,
          delivery_mode: nil,
          lead_time: nil,
          search_radius: nil,
          trade_type: nil,
          nance: nil,
          number_of_results: nil,
        }.freeze
      end
    end
  end
end
