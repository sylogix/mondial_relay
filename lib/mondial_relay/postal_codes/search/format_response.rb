# frozen_string_literal: true

require 'interactor/initializer'

module MondialRelay
  module PostalCodes
    class Search
      class FormatResponse
        include Interactor::Initializer

        initialize_with :response

        def run
          response.dig(:liste, :commune) || []
        end
      end
    end
  end
end
