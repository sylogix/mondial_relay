# frozen_string_literal: true

module MondialRelay
  module DropOffPoints
    # An interface for *drop-off* point search.
    # Requests the {https://api.mondialrelay.com/Web_Services.asmx?op=WSI4_PointRelais_Recherche
    # WSI4_PointRelais_Recherche} endpoint.
    #
    # Available search params (*M* — mandatory, *O* — optional):
    #
    # - **Pays** — country code (ISO) *M*.
    # - **NumPointRelais** — particular drop-off point ID *O/M*.
    # - **Ville** — should not be used *O/M*.
    # - **CP** — zip code as a search origin *O/M*.
    #   Results will be sorted by distance from the origin.
    #   Optional if the city is provided.
    # - **Latitude** — latitude as a search origin *O/M*.
    #   Has priority over zip code.
    # - **Longitude** — longitude as as a search origin *O/M*.
    #   Has priority over zip code.
    # - **Taille** — size `^(XS|S|M|L|XL|XXL|3XL)$`.
    #   Do not use this unless specified by Mondial Relay *O*.
    # - **Poids** — weight (in grams) *O*.
    # - **Action** — delivery mode `^(REL|24R|24L|24X|DRI|24C)$` *O*.
    # - **DelaiEnvoi** — parameter which permits to specify the lead time.
    # - **RayonRecherche** — search radius (in km) *O*. Default 50.
    # - **TypeActivite** — trade type *O*.
    # - **NACE** — should not use *O*.
    # - **NombreResultats** - number of results (max 30) *O*.
    #
    # **NOTE**: all params must be provided in the order specified above.
    #
    # @example
    #   # Do the drop-off point search:
    #   MondialRelay::DropOffPoints::Search.for(
    #     Pays: 'FR',
    #     CP: '75010',
    #     Latitude: '48.8711706',
    #     Longitude: '02.3602504'
    #   )
    class Search < Operation
      OPERATION = :wsi4_point_relais_recherche

      # @!visibility private
      def run
        response = MondialRelay::Query.run(OPERATION, preprocessed_params)
        response.dig(:points_relais, :point_relais_details) || []
      end
    end
  end
end
