# frozen_string_literal: true

module MondialRelay
  # An interface for *drop-off* point search.
  # Requests the {https://api.mondialrelay.com/Web_Services.asmx?op=WSI3_PointRelais_Recherche
  # WSI3_PointRelais_Recherche} endpoint.
  #
  # Available search params (*M* — mandatory, *O* — optional):
  # - **Pays** `(String)` — ISO country code *(M)*.
  #
  # - **NumPointRelais** `(String)` — particular *drop-off* point ID *(O/M)*.
  #
  # - **Ville** `(String)` — should not be used *(O/M)*.
  #
  # - **CP** `(String)` — zip code as a search origin *(O/M)*.
  #   Results will be sorted by the distance from the origin.
  #   Optional if the city is provided.
  #
  # - **Latitude** `(String)` — latitude as a search origin *(O/M)*.
  #   Has priority over zip code.
  #
  # - **Longitude** `(String)` — longitude as as a search origin *(O/M)*.
  #   Has priority over zip code.
  #
  # - **Taille** `(String)` — size (`^(XS|S|M|L|XL|XXL|3XL)$`).
  #   Do not use unless specified by Mondial Relay *(O)*.
  #
  # - **Poids** `(String)` — weight (in grams) *(O)*.
  #
  # - **Action** `(String)` — delivery mode (`^(REL|24R|24L|24X|DRI|24C)$`) *(O)*.
  #
  # - **DelaiEnvoi** `(String)` — parameter which permits to specify the lead time.
  #
  # - **RayonRecherche** `(String)` — search radius (in km) *(O)*. Default 50.
  #
  # - **TypeActivite** `(String)` — trade type *(O)*.
  #
  # - **NACE** `(String)` — should not use *(O)*.
  module DropOffPoints
    OPERATION = :wsi3_point_relais_recherche

    module_function

    # Does the *drop-off* point search.
    # @param params [Hash] with the keys provided in a module description.
    #   Only mandatory fields **must** be included.
    # @return [Array<Hash>] an array with *drop-off* points details.
    #
    # @example
    #   MondialRelay::DropOffPoints.search(
    #     Pays: 'FR',
    #     CP: '75010',
    #     Latitude: '48.8711706',
    #     Longitude: '02.3602504'
    #   )
    def search(params)
      response = MondialRelay::Response.for(OPERATION, params)
      response[:points_relais][:point_relais_details]
    end
  end
end
