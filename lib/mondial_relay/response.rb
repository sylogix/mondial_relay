# frozen_string_literal: true

require 'interactor/initializer'

module MondialRelay
  class Response
    include Interactor::Initializer

    initialize_with :operation, :params

    def run
      return response_body if status == '0'
      raise ResponseError.new(status)
    end

    private

    def response_body
      @response_body ||= response.body[response_key][result_key]
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
