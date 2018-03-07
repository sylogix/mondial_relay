# frozen_string_literal: true
module MondialRelay
  class Query
    attr_reader :operation, :params

    def self.run(operation, params)
      new(operation, params).execute!
    end

    def initialize(operation, params)
      @operation = operation
      @params = params
    end

    def execute!
      return response_body if StatusCodes.success?(status)
      raise ResponseError.new(status)
    end

    private

    def response_body
      @response_body ||= response.body.dig(response_key, result_key)
    end

    def response
      @response ||= MondialRelay.client.call(request)
    end

    def request
      MondialRelay::Request.new(operation, params)
    end

    def response_key
      "#{operation}_response".to_sym
    end

    def result_key
      "#{operation}_result".to_sym
    end

    def status
      @status ||= response_body[:stat]
    end
  end
end
