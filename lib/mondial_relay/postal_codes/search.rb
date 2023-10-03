# frozen_string_literal: true

module MondialRelay
  module PostalCodes
    # An interface for postal codes search.
    #
    # Available search params (*M* — mandatory, *O* — optional):
    #
    # - **country** — country code (ISO) *M*.
    # - **city** — *O/M*.
    # - **postal_code** — *O/M*.
    # - **number_of_results** - number of results (max 15) — *O/M*.
    #
    # @example
    #   # Do the postal code search:
    #   MondialRelay::PostalCodes::Search.for(
    #     mondial_account,
    #     country: 'FR',
    #     city: 'Toulouse'
    #   )
    class Search < Operation
      configure operation: :wsi2_recherche_cp
    end
  end
end
