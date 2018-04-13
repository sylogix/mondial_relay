# frozen_string_literal: true

require 'mondial_relay/translatable'
require 'mondial_relay/formattable'
require 'mondial_relay/has_defaults'
require 'interactor/initializer'

module MondialRelay
  class Operation
    include MondialRelay::Translatable
    include MondialRelay::Formattable
    include MondialRelay::HasDefaults

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
      params_with_defaults = add_defaults_to_params(params)
      translated_params = translate_params(params_with_defaults)
      format_params(translated_params)
    end

    def adjusted_response
      translated_response = translate_response(response)
      format_response(translated_response)
    end

    def response
      MondialRelay::Query.run(operation_name, adjusted_params)
    end
  end
end
