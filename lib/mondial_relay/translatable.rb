# frozen_string_literal: true

module MondialRelay
  module Translatable
    def translated_params
      Hash[params.map { |name, value| [translate_param(name), value] }]
    end

    private

    def translate_param(name)
      self.class::Translations::PARAMS[name] || name
    end
  end
end
