# frozen_string_literal: true

module MondialRelay
  module Services
    class ParcelShopsService < BaseService
      #WSDL_URL = 'https://api-parcelshop.mondialrelay.com/Web_Services.asmx?WSDL'
      WSDL_URL = File.join(File.dirname(__FILE__), 'wsdl/parcel_shops.wsdl')

      def initialize
        super(:parcel_shops)
      end

      def wsdl_url
        WSDL_URL
      end
    end
  end
end
