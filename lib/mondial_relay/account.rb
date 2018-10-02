# frozen_string_literal: true

module MondialRelay
  class Account
    attr_reader :id, :secret

    def initialize(id, secret)
      @id = id
      @secret = secret
    end
  end
end
