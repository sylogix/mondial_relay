# frozen_string_literal: true

module MondialRelay
  class ResponseError < StandardError
    def initialize(status)
      @status = status
    end

    def message
      STATUS_CODES[@status] || 'Unknown error'
    end
  end
end
