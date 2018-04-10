# frozen_string_literal: true

require 'interactor/initializer'

module MondialRelay
  class Operation
    include Interactor::Initializer

    initialize_with :params

    # @!visibility private
    def run
      raise NotImplementedError
    end
  end
end
