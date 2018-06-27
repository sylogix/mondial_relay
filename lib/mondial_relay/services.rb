# frozen_string_literal: true

require 'active_support/inflector'

module MondialRelay
  module Services
    module_function

    def build(service_name)
      class_name = "#{service_name}_service".camelize
      Services.const_get(class_name).new
    rescue NameError
      raise InvalidServiceError
    end
  end
end
