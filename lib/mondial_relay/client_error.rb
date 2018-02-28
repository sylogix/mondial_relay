# frozen_string_literal: true

module MondialRelay
  class ClientError < StandardError
    def initialize(message = nil)
      @message = message
    end

    def message
      @message || 'Unknown error'
    end
  end
end
