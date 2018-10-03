# frozen_string_literal: true

module MondialRelay
  module Labels
    # An interface for *labels* fetching.
    # Requests the {https://api.mondialrelay.com/Web_Services.asmx?op=WSI3_GetEtiquettes
    # WSI3_GetEtiquettes} endpoint.
    #
    # Available fetching params (*M* — mandatory, *O* — optional):
    #
    # - **shipment_numbers** — shipment numbers (semicolon separated) *M*.
    # - **language** — language *M*.
    #
    # @example
    #   # Fetch labels of several sizes for provided shipments:
    #   MondialRelay::Labels::Fetch.for(
    #     mondial_account,
    #     shipment_numbers: '31236189;31236105',
    #     language: 'FR',
    #   )
    #
    #   # Results in:
    #   {
    #     stat: '0',
    #     url_pdf_a4: '',
    #     url_pdf_a5: '',
    #     url_pdf_10x15: '',
    #   }
    class Fetch < Operation
      configure operation: :wsi3_get_etiquettes
    end
  end
end
