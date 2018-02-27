# frozen_string_literal: true

module Fixtures
  def load_fixture(file_name)
    File.read("spec/fixtures/#{file_name}.xml")
  end
end

RSpec.configure do |config|
  config.include Fixtures
end
