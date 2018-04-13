# frozen_string_literal: true

require 'active_support/core_ext/hash/deep_merge'

module MondialRelay
  module HasDefaults
    def add_defaults_to_params(params)
      self.class::Defaults::PARAMS.deep_merge(params)
    end
  end
end
