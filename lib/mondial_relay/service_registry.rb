# frozen_string_literal: true

module MondialRelay
  class ServiceRegistry
    def initialize
      @registry = {}
    end

    def register(service)
      @registry[service.name] = service
    end

    def resolve(service_name)
      @registry[service_name]
    end
  end
end
