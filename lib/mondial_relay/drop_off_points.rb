# frozen_string_literal: true

module MondialRelay
  module DropOffPoints
    OPERATION = :wsi3_point_relais_recherche

    module_function

    def search(params)
      MondialRelay::Response.for(OPERATION, params)
    end
  end
end
