# frozen_string_literal: true

module MondialRelay
  class Error < StandardError; end

  class ClientError < Error; end

  class TimeoutError < Error; end

  class EncodingError < Error; end

  class ResponseError < Error
    attr_reader :status

    def initialize(status)
      @status = status&.to_i
    end

    def message
      "#{status} - #{STATUS_CODES[status] || 'Unknown error'}"
    end
  end
end
