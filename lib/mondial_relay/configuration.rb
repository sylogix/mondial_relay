# frozen_string_literal: true

module MondialRelay
  class Configuration
    DEFAULT_SERVICES = %i(generic).freeze

    attr_accessor :api_wsdl_url, :api_url, :merchant_id, :api_secret,
                  :api_timeout, :api_max_retries, :debug, :monitor,
                  :enabled_services

    attr_reader :http_adapter

    def initialize
      @api_wsdl_url = 'https://api.mondialrelay.com/Web_Services.asmx?WSDL'
      @api_url = 'http://www.mondialrelay.fr/webservice/'

      @merchant_id = nil
      @api_secret = nil

      @api_timeout = 10
      @api_max_retries = 2

      @enabled_services = DEFAULT_SERVICES

      @debug = false
      @monitor = nil

      @http_adapter = :net_http
    end
  end
end
