# frozen_string_literal: true

module MondialRelay
  module Shipments
    # An interface for *shipment* tracing.
    # Requests the {https://api.mondialrelay.com/Web_Services.asmx?op=WSI2_TracingColisDetaille
    # WSI2_TracingColisDetaille} endpoint.
    #
    # Available tracing params (*M* — mandatory, *O* — optional):
    #
    # - **shipment_number** — shipment number *M*.
    # - **language** — language *M*.
    #
    # @example
    #   # Get the shipment details:
    #   MondialRelay::Shipments::Trace.for(
    #     shipment_number: '31236105',
    #     language: 'FR',
    #   )
    #
    #   # Results in:
    #   {
    #     stat: '0',
    #     last_status: 'last status',
    #     drop_off_point_name: 'drop-off point name',
    #     drop_off_point_id: 'drop-off point id',
    #     last_status_additional: 'extra information',
    #     tracing: {
    #       details: [
    #         {
    #           status: 'tracing name',
    #           date: 'tracing date',
    #           hour: 'tracing hour',
    #           location: 'tracing city',
    #           drop_off_point_id: 'drop-off point id',
    #           drop_off_point_country: 'drop-off point country',
    #         },
    #         # ...
    #       ]
    #     }
    #   }
    class Trace < Operation
      operation_name :wsi2_tracing_colis_detaille
    end
  end
end
