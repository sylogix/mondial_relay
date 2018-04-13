# Mondial Relay API client

[![Build Status](https://travis-ci.org/vinted/mondial_relay.svg?branch=master)](https://travis-ci.org/vinted/mondial_relay)
[![Gem Version](https://badge.fury.io/rb/mondial_relay.svg)](https://badge.fury.io/rb/mondial_relay)

The gem works as an interface to the
[Mondial Relay Web service](https://api.mondialrelay.com/Web_Services.asmx).

### Usage
Detailed usage examples and available options can be obtained in a gem's [docs](http://www.rubydoc.info/gems/mondial_relay).

#### Getting started
A minimal gem's configuration is obtained by providing your credentials to the [Mondial Relay Web service](https://api.mondialrelay.com/Web_Services.asmx):
```ruby
MondialRelay.configure do |config|
  config.merchant_id = 'Your Merchant ID'
  config.api_secret = 'Your Private Key'
end
```

#### Drop-Off Points
Do the drop-off point search:
```ruby
MondialRelay::DropOffPoints::Search.for(
  country: 'FR',
  postal_code: '75010',
  latitude: '48.8711706',
  longitude: '02.3602504',
)
```
See the [docs](http://www.rubydoc.info/gems/mondial_relay) for a detailed list of search options.

#### Labels
Create a shipment and return its number with a label url:
```ruby
MondialRelay::Labels::Create.for(
  collection_mode: 'REL',
  delivery_mode: '24R',
  sender_language: 'FR',
  sender_name: 'Test Sender',
  # ...
)
```
Fetch labels of several sizes for provided shipments:
```ruby
MondialRelay::Labels::Fetch.for(
  shipment_numbers: '31236189',
  language: 'FR',
)
```
See the [docs](http://www.rubydoc.info/gems/mondial_relay) for a detailed list of options.

#### Shipments
Create a shipment and return its number with some extra information:
```ruby
MondialRelay::Shipments::Create.for(
  collection_mode: 'REL',
  delivery_mode: '24R',
  sender_language: 'FR',
  sender_name: 'Test Sender',
  # ...
)
```
Get the shipment details:
```ruby
MondialRelay::Shipments::Trace.for(
  shipment_number: '31236189',
  language: 'FR',
)
```
See the [docs](http://www.rubydoc.info/gems/mondial_relay) for a detailed list of options.

### Documentation
Documentation is generated using [Yard](https://yardoc.org/).

### Contribution
- Each endpoint (operation) should be documented.
- Each entity (e.g. *drop-off* point) should provide a public interface to query the API.
