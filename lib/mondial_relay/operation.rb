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

    DEFAULT_SERVICE = :generic

    class << self
      attr_reader :operation, :service

      def configure(operation:, service: nil)
        @operation = operation
        @service = service || DEFAULT_SERVICE
      end
    end

    initialize_with :params

    def run
      adjusted_response
    end

    private

    def adjusted_params
      params_with_defaults = add_defaults_to_params(params)
      formatted_params = format_params(params_with_defaults)
      translate_params(formatted_params)
    end

    def adjusted_response
      translated_response = translate_response(response)
      format_response(translated_response)
    end

    def response
      MondialRelay::Query.run(service, operation, adjusted_params)
    end

    def operation
      self.class.operation
    end

    def service_name
      self.class.service
    end

    def service
      MondialRelay.services.resolve(service_name)
    end
  end
end
