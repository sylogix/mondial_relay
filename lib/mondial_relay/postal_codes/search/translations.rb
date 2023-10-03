# frozen_string_literal: true

module MondialRelay
  module PostalCodes
    class Search
      module Translations
        PARAMS = {
          country: :Pays,
          city: :Ville,
          postal_code: :CP,
          number_of_results: :NbResult,
        }.freeze

        RESPONSE = {
          cp: :postal_code,
          ville: :city,
          pays: :country,
        }.freeze
      end
    end
  end
end
