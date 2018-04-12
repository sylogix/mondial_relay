# frozen_string_literal: true

require 'active_support/core_ext/object/deep_dup'

module MondialRelay
  module Translatable
    def translated_params
      translate_object_keys!(params.deep_dup) do |key|
        translate_param_key(key)
      end
    end

    def translated_response
      translate_object_keys!(response.deep_dup) do |key|
        translate_response_key(key)
      end
    end

    private

    def translate_object_keys!(object, &translator)
      if object.respond_to?(:keys)
        object.keys.each do |key|
          new_key = translator.call(key)
          object[new_key] = object.delete(key)

          if object[new_key].respond_to?(:each)
            translate_object_keys!(object[new_key], &translator)
          end
        end
      elsif object.respond_to?(:each)
        object.each do |item|
          translate_object_keys!(item, &translator)
        end
      end

      object
    end

    def translate_param_key(key)
      self.class::Translations::PARAMS[key] || key
    end

    def translate_response_key(key)
      self.class::Translations::RESPONSE[key] || key
    end
  end
end
