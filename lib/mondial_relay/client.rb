# frozen_string_literal: true

require 'savon'

module MondialRelay
  class Client
    def initialize
      @soap_client = Savon.client(config)
    end

    def config
      @config ||= {
        wsdl: MondialRelay.config.api_wsdl_url,

        convert_request_keys_to: :none,
        element_form_default: :unqualified,
        env_namespace: :soap,

        open_timeout: MondialRelay.config.api_timeout,
        read_timeout: MondialRelay.config.api_timeout,

        log: MondialRelay.config.debug,
        log_level: :debug,
        pretty_print_xml: true,
      }
    end

    def call(request)
      with_retry do
        @soap_client.call(
          request.operation,
          message: request.message,
          attributes: request.attributes,
        )
      end
    end

    def operations
      @soap_client.operations
    end

    private

    def with_retry
      max_retries.times do |i|
        begin
          return yield
        rescue Savon::Error, Net::OpenTimeout, Net::ReadTimeout => e
          raise e if i + 1 == max_retries
        end
      end
    end

    def max_retries
      @max_retries ||= MondialRelay.config.api_max_retries
    end
  end
end
