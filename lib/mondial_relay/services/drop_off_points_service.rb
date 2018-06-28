# frozen_string_literal: true

module MondialRelay
  module Services
    class DropOffPointsService < BaseService
      WSDL_URL = 'https://api-parcelshop.mondialrelay.com/Web_Services.asmx?WSDL'

      def initialize
        super(:drop_off_points)
      end

      def wsdl_url
        WSDL_URL
      end
    end
  end
end
