# frozen_string_literal: true

require 'interactor/initializer'

module MondialRelay
  module DropOffPoints
    class Search
      class FormatResponse
        include Interactor::Initializer

        initialize_with :response

        def run
          response.dig(:points_relais, :point_relais_details) || []
        end
      end
    end
  end
end
