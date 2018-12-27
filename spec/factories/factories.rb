# frozen_string_literal: true

FactoryBot.define do
  factory :client, class: MondialRelay::Client do
    wsdl_url { 'https://api.mondialrelay.com' }

    initialize_with { new(wsdl_url) }
  end

  factory :account, class: MondialRelay::Account do
    id { 'BDTEST13' }
    secret { 'PrivateK' }
    initialize_with { new(id, secret) }
  end

  factory :request, class: MondialRelay::Request do
    operation { :test }
    account { build(:account) }
    params { { v1: 'v1', k2: 'v2' } }

    initialize_with { new(operation, account, params) }
  end

  factory :configuration, class: MondialRelay::Configuration do; end

  factory :query, class: MondialRelay::Query do
    operation { :test }
    account { build(:account) }
    params { { v1: 'v1', k2: 'v2' } }

    initialize_with { new(operation, account, params) }
  end

  factory :generic_service, class: MondialRelay::Services::GenericService
  factory :drop_off_points_service, class: MondialRelay::Services::DropOffPointsService

  factory :service_registry, class: MondialRelay::ServiceRegistry
end
