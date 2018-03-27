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
      result = response_body

      with_monitoring do
        return result if StatusCodes.success?(status)
        raise ResponseError, status
      end
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
      response_body[:stat]&.to_i
    end

    def with_monitoring
      MondialRelay.monitor(monitorable_data)
      yield
    end

    def monitorable_data
      {
        request: request,
        response_body: response_body,
        status: status,
      }
    end
  end
end
