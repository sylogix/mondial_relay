# frozen_string_literal: true

module MondialRelay
  module Services
    class GenericService < BaseService
      WSDL_URL = 'https://api.mondialrelay.com/Web_Services.asmx?WSDL'

      def initialize
        super(:generic)
      end

      def wsdl_url
        WSDL_URL
      end
    end
  end
end
