# frozen_string_literal: true

module MondialRelay
  module PostalCodes
    class Search
      module Defaults
        PARAMS = {
          country: nil,
          city: nil,
          postal_code: nil,
          number_of_results: 15,
        }.freeze
      end
    end
  end
end
