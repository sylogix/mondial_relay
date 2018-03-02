# frozen_string_literal: true

module MondialRelay
  class Configuration
    attr_accessor :api_wsdl_url, :api_url, :merchant_id,
                  :api_secret, :api_timeout, :api_max_retries, :debug

    def initialize
      @api_wsdl_url = 'https://api.mondialrelay.com/Web_Services.asmx?WSDL'
      @api_url = 'http://www.mondialrelay.fr/webservice/'

      @merchant_id = nil
      @api_secret = nil

      @api_timeout = 10
      @api_max_retries = 2

      @debug = false
    end

    def validate!
      raise ArgumentError, 'api wsd url not found' unless api_wsdl_url
      raise ArgumentError, 'api url not found' unless api_url
      raise ArgumentError, 'merchant not found' unless merchant_id
      raise ArgumentError, 'api secret not found ' unless api_secret
      self
    end
  end
end
