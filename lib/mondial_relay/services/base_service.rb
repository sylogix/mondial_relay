# frozen_string_literal: true

module MondialRelay
  module Services
    class BaseService
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def client
        @client ||= Client.new(wsdl_url)
      end

      def wsdl_url
        raise NotImplementedError
      end
    end
  end
end
