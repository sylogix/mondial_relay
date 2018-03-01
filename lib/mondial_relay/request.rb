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
      merchant_id_params
        .merge(params)
        .merge(security_code_params)
    end

    private

    def merchant_id_params
      { Enseigne: MondialRelay.config.merchant_id }
    end

    def security_code_params
      { Security: SecurityCode.for(params.values) }
    end
  end
end
