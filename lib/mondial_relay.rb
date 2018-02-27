# frozen_string_literal: true

require 'mondial_relay/version'
require 'mondial_relay/configuration'
require 'mondial_relay/client'
require 'mondial_relay/request'
require 'mondial_relay/security_code'

module MondialRelay
  module_function

  def config
    @config ||= Configuration.new
  end

  def reset
    @config = Configuration.new
  end

  def configure
    yield(config)
    config.validate!
  end
end
