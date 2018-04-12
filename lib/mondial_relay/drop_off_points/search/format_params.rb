# frozen_string_literal: true

require 'interactor/initializer'

module MondialRelay
  module DropOffPoints
    class Search
      class FormatParams
        include Interactor::Initializer

        initialize_with :params

        def run
          params.merge(formatted_coordinates)
        end

        private

        def formatted_coordinates
          Hash[coordinates.map { |key, val| [key, format('%010.7f', val.to_f)] }]
        end

        def coordinates
          params.slice(:latitude, :longitude).compact
        end
      end
    end
  end
end
