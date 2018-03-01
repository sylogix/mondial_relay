# frozen_string_literal: true

require 'interactor/initializer'

module MondialRelay
  module Labels
    # An interface for *labels* fetching.
    # Requests the {https://api.mondialrelay.com/Web_Services.asmx?op=WSI3_GetEtiquettes
    # WSI3_GetEtiquettes} endpoint.
    #
    # Available fetching params (*M* — mandatory, *O* — optional):
    #
    # - **Expeditions** — shipment numbers (semicolon separated) *M*.
    # - **Langue** — language *M*.
    #
    # **NOTE**: all params must be provided in the order specified above.
    #
    # @example
    #   # Create a shipment and return its number with a label url:
    #   MondialRelay::Labels::Fetch.for(
    #     Expeditions: '31236189;31236105',
    #     Langue: 'FR',
    #   )
    #
    #   # Results in:
    #   {
    #     stat: '0',
    #     url_pdf_a4: '',
    #     url_pdf_a5: '',
    #     url_pdf_10x15: '',
    #   }
    class Fetch
      include Interactor::Initializer

      OPERATION = :wsi3_get_etiquettes

      initialize_with :params

      # @!visibility private
      def run
        MondialRelay::Query.run(OPERATION, params)
      end
    end
  end
end
