# frozen_string_literal: true

module MondialRelay
  module ParcelShops
    # An interface for *parcel shop* search.
    # Requests the
    # {https://api-parcelshop.mondialrelay.com/Web_Services.asmx?op=WSI4_PointRelais_Recherche
    # WSI4_PointRelais_Recherche} endpoint.
    #
    # Available search params (*M* — mandatory, *O* — optional):
    #
    # - **country_code** — country code (ISO) *M*.
    # - **parcel_shop_id** — particular parcel shop ID *O/M*.
    # - **city** — should not be used *O/M*.
    # - **postal_code** — zip code as a search origin *O/M*.
    #   Results will be sorted by distance from the origin.
    #   Optional if the city is provided.
    # - **latitude** — latitude as a search origin *O/M*.
    #   Has priority over zip code.
    # - **longitude** — longitude as as a search origin *O/M*.
    #   Has priority over zip code.
    # - **parcel_size** — size `^(XS|S|M|L|XL|XXL|3XL)$`.
    #   Do not use this unless specified by Mondial Relay *O*.
    # - **parcel_weight** — weight (in grams) *O*.
    # - **delivery_mode** — delivery mode `^(REL|24R|24L|24X|DRI|24C)$` *O*.
    # - **lead_time** — parameter which permits to specify the lead time.
    # - **search_radius** — search radius (in km) *O*. Default 50.
    # - **trade_type** — trade type *O*.
    # - **nance** — should not use *O*.
    # - **number_of_results** - number of results (max 30) *O*.
    #
    # @example
    #   # Do the parcel shop search:
    #   MondialRelay::ParcelShops::Search.for(
    #     mondial_account,
    #     country: 'FR',
    #     postal_code: '75010',
    #     latitude: '48.8711706',
    #     longitude: '02.3602504'
    #   )
    class Search < Operation
      configure operation: :wsi4_point_relais_recherche, service: :parcel_shops
    end
  end
end
