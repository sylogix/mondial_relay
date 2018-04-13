# frozen_string_literal: true

require 'digest'
require 'interactor/initializer'

module MondialRelay
  class SecurityCode
    EXCLUDE_FOR_OPERATION = {
      wsi2_creation_etiquette: %i(Texte),
      wsi2_creation_expedition: %i(Texte),
    }.freeze

    include Interactor::Initializer

    initialize_with :operation, :params

    def run
      Digest::MD5.hexdigest(params_for_digest).upcase
    end

    private

    def params_for_digest
      [
        MondialRelay.config.merchant_id,
        params.except(*params_to_exclude).values.join,
        MondialRelay.config.api_secret,
      ].join.encode('windows-1252')
    rescue Encoding::UndefinedConversionError
      raise EncodingError
    end

    def params_to_exclude
      EXCLUDE_FOR_OPERATION[operation] || []
    end
  end
end
