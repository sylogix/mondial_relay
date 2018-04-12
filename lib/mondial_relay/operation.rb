# frozen_string_literal: true

require 'mondial_relay/translatable'
require 'interactor/initializer'

module MondialRelay
  class Operation
    include MondialRelay::Translatable
    include Interactor::Initializer

    initialize_with :params

    # @!visibility private
    def run
      raise NotImplementedError
    end

    private

    def preprocessed_params
      self.class::PreprocessParams.for(translated_params)
    end
  end
end
