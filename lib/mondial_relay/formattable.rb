# frozen_string_literal: true

module MondialRelay
  module Formattable
    def format_params(params)
      return params unless defined?(self.class::FormatParams)
      self.class::FormatParams.for(params)
    end

    def format_response(response)
      return response unless defined?(self.class::FormatResponse)
      self.class::FormatResponse.for(response)
    end
  end
end
