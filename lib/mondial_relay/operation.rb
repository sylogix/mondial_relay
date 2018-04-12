# frozen_string_literal: true

require 'mondial_relay/translatable'
require 'mondial_relay/formattable'
require 'interactor/initializer'

module MondialRelay
  class Operation
    include MondialRelay::Translatable
    include MondialRelay::Formattable

    include Interactor::Initializer

    class << self
      attr_reader :service_endpoint

      def operation_name(service_endpoint)
        @service_endpoint = service_endpoint
      end
    end

    initialize_with :params

    def run
      adjusted_response
    end

    private

    def operation_name
      self.class.service_endpoint
    end

    def adjusted_params
      format_params(translate_params(params))
    end

    def adjusted_response
      format_response(translate_response(response))
    end

    def response
      MondialRelay::Query.run(operation_name, adjusted_params)
    end
  end
end
