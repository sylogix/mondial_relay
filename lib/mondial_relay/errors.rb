# frozen_string_literal: true

module MondialRelay
  class Error < StandardError; end

  class ClientError < Error; end

  class TimeoutError < Error; end

  class EncodingError < Error; end

  class ResponseError < Error
    def initialize(status)
      @status = status
    end

    def message
      "#{@status} - #{STATUS_CODES[@status] || 'Unknown error'}"
    end
  end
end
