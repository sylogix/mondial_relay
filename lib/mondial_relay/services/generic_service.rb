# frozen_string_literal: true

module MondialRelay
  module Services
    class GenericService < BaseService
      #WSDL_URL = 'https://api.mondialrelay.com/Web_Services.asmx?WSDL'
      WSDL_URL = File.join(File.dirname(__FILE__), 'wsdl/generic.wsdl')

      def initialize
        super(:generic)
      end

      def wsdl_url
        WSDL_URL
      end
    end
  end
end
