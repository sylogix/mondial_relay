# frozen_string_literal: true

require 'mondial_relay/version'
require 'mondial_relay/configuration'
require 'mondial_relay/errors'

require 'mondial_relay/status_codes'
require 'mondial_relay/security_code'
require 'mondial_relay/client'
require 'mondial_relay/request'
require 'mondial_relay/query'

require 'mondial_relay/operation'
require 'mondial_relay/translatable'
require 'mondial_relay/formattable'
require 'mondial_relay/has_defaults'

require 'mondial_relay/drop_off_points/search'
require 'mondial_relay/drop_off_points/search/format_params'
require 'mondial_relay/drop_off_points/search/format_response'
require 'mondial_relay/drop_off_points/search/translations'
require 'mondial_relay/drop_off_points/search/defaults'

require 'mondial_relay/labels/create'
require 'mondial_relay/labels/create/translations'
require 'mondial_relay/labels/create/defaults'

require 'mondial_relay/labels/fetch'
require 'mondial_relay/labels/fetch/translations'
require 'mondial_relay/labels/fetch/defaults'

require 'mondial_relay/shipments/create'
require 'mondial_relay/shipments/create/translations'
require 'mondial_relay/shipments/create/defaults'

require 'mondial_relay/shipments/trace'
require 'mondial_relay/shipments/trace/translations'
require 'mondial_relay/shipments/trace/defaults'

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
  end

  def client
    @client ||= Client.new
  end

  def monitor(monitorable)
    return unless config.monitor.respond_to?(:call)
    config.monitor.call(monitorable)
  end
end
