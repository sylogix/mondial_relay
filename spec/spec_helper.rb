# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'mondial_relay'
require 'support/factory_bot'
require 'webmock/rspec'
require 'mondial_relay/shared_examples/query'
require 'mondial_relay/shared_examples/translatable'
require 'mondial_relay/shared_examples/operation'
require 'mondial_relay/shared_examples/service'

RSpec.configure do |config|
  config.before do
    MondialRelay.configure do |mr_config|
      mr_config.api_max_retries = 1
      mr_config.debug = true
    end
  end
end
