# frozen_string_literal: true

require 'digest'
require 'interactor/initializer'

module MondialRelay
  class SecurityCode
    include Interactor::Initializer

    initialize_with :params

    def run
      Digest::MD5.hexdigest(params_for_digest).upcase
    end

    private

    def params_for_digest
      [
        MondialRelay.config.merchant_id,
        params.join,
        MondialRelay.config.api_secret,
      ].join.encode('windows-1252')
    rescue Encoding::UndefinedConversionError
      raise EncodingError
    end
  end
end
