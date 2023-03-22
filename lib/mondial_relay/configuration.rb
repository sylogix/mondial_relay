# frozen_string_literal: true

module MondialRelay
  class Configuration
    DEFAULT_SERVICES = %i(
      generic
      parcel_shops
    ).freeze

    API_URL = 'http://www.mondialrelay.fr/webservice/'

    attr_accessor :api_url, :api_timeout, :api_max_retries,
      :enabled_services, :debug, :monitor, :logger

    attr_reader :http_adapter

    def initialize
      @api_url = API_URL

      @api_timeout = 10
      @api_max_retries = 2

      @enabled_services = DEFAULT_SERVICES

      @debug = false
      @monitor = nil
      @logger = Logger.new($stdout)

      @http_adapter = :net_http
    end
  end
end
