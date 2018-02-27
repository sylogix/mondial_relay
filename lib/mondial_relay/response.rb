# frozen_string_literal: true

require 'interactor/initializer'

module MondialRelay
  class Response
    include Interactor::Initializer

    initialize_with :operation, :params

    def run
      response_body = MondialRelay.client.call(request).body
      response_body[response_key][result_key]
    end

    private

    def request
      MondialRelay::Request.new(operation, params)
    end

    def response_key
       "#{operation}_response".to_sym
    end

    def result_key
      "#{operation}_result".to_sym
    end
  end
end
