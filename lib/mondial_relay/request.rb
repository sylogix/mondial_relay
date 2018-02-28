# frozen_string_literal: true

module MondialRelay
  class Request
    attr_reader :operation, :params

    def initialize(operation, params = {})
      @operation = operation
      @params = params.reject { |_, val| val.size.zero? }
    end

    def attributes
      { xmlns: MondialRelay.config.api_url }
    end

    def message
      merchant_id
        .merge(params)
        .merge(security_code)
    end

    private

    def merchant_id
      { Enseigne: MondialRelay.config.merchant_id }
    end

    def security_code
      { Security: SecurityCode.for(params.values) }
    end
  end
end
