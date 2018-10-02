# frozen_string_literal: true

module MondialRelay
  class Request
    attr_reader :operation, :account, :params

    def initialize(operation, account, params = {})
      @operation = operation
      @account = account
      @params = params.reject { |_, val| val.to_s.size.zero? }
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
      { Enseigne: account.id }
    end

    def security_code_params
      { Security: SecurityCode.for(operation, account, params) }
    end
  end
end
