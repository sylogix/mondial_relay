# frozen_string_literal: true

module MondialRelay
  module Shipments
    # An interface for *shipment* creation.
    # Requests the {https://api.mondialrelay.com/Web_Services.asmx?op=WSI2_CreationExpedition
    # WSI2_CreationExpedition} endpoint.
    #
    # Available creation params (*M* — mandatory, *O* — optional):
    #
    # - **collection_mode** — collection mode `^(CCC|CDR|CDS|REL)$` *M*.
    # - **delivery_mode** — delivery mode `^(LCC|LD1|LDS|24R|24L|24X|24C|ESP|DRI)$` *M*.
    # - **shipment_reference** — merchant shipment reference (e.g invoice number) *O*.
    # - **sender_reference** — sender's reference *O*.
    # - **sender_language** — sender's language *M*.
    # - **sender_name** — sender's particulars, name, first name *M*.
    # - **sender_name_additional** — sender's other name information *O*.
    # - **sender_address** — sender's street *M*.
    # - **sender_address_additional** — sender's extra address information *O*.
    # - **sender_city** — sender's city *M*.
    # - **sender_postal_code** — sender's zip code *M*.
    # - **sender_country** — sender's country code (ISO) *M*.
    # - **sender_phone_number** — sender's phone number *M*.
    # - **sender_mobile_number** — sender's cell number *O*.
    # - **sender_email** — sender's email address *O*.
    # - **receiver_language** — consignee's language *M*.
    # - **receiver_name** — consignee's particulars, name, first name *M*.
    # - **receiver_name_additional** — consignee's other name information *O*.
    # - **receiver_address** — consignee's street *M*.
    # - **receiver_address_additional** — consignee's extra address information *O*.
    # - **receiver_city** — consignee's city *M*.
    # - **receiver_postal_code** — consignee's zip code *M*.
    # - **receiver_country** — consignee's country code (ISO) *M*.
    # - **receiver_phone_number** — consignee's phone number (obligatory for home delivery) *O/M*.
    # - **receiver_mobile_number** — consignee's cell phone *O*.
    # - **receiver_email** — consignee's email address *O*.
    # - **parcel_weight** — weight (in grams) *M*.
    # - **parcel_length** — length (in cm) *O*.
    # - **parcel_size** — leave empty *O*.
    # - **parcel_count** — number of parcels in shipment *M*.
    # - **cod_price** — COD shipment value (in cents) *M*.
    # - **cod_price_currency** — currency of COD value (EUR) *O*.
    # - **price** — shipment value (in cents) *O*.
    # - **currency** — currency of shipment value (EUR) *O*.
    # - **collection_country** — pickup point country code (ISO) *O/M*.
    #   Obligatory if collected at Point Relais.
    # - **collection_drop_off_point_id** — pickup point ID *O/M*.
    #   Obligatory if collected at Point Relais.
    # - **delivery_country** — drop-off point country code (ISO) *O/M*.
    #   Obligatory if delivered at Point Relais.
    # - **delivery_drop_off_point_id** — drop-off point ID *O/M*.
    #   Obligatory if delivered at Point Relais.
    # - **notify** — notification request for shipment `^(|O|N)$` *O*.
    # - **reprise** — `^(|O|N)$` *O*.
    # - **assembly_time** — assembly time *O*. Zero by default.
    # - **request_for_delivery_appointment** — request for delivery appointment `^(|O|N)$` *O*.
    # - **assurance** — insurance coverage *O*. Zero by default.
    # - **instructions** — extra information *O*.
    # - **text** — DO NOT use for security code calculation *O*.
    #
    # @example
    #   # Create a shipment and returns its number with a label url:
    #   MondialRelay::Shipments::Create.for(
    #     sender_name: 'Test Sender',
    #     sender_address: '38 Route de Rennes',
    #     sender_city: 'Nantes',
    #     sender_postal_code: '44300',
    #     sender_country: 'FR',
    #     sender_phone_number: '+3300000000',
    #
    #     receiver_name: 'Test Receiver',
    #     receiver_address: 'Bouwhandelstraat 94-138',
    #     receiver_city: 'Antwerpen',
    #     receiver_postal_code: '2140',
    #     receiver_country: 'BE',
    #
    #     parcel_weight: 500,
    #     collection_country: 'FR',
    #     collection_drop_off_point_id: '094170',
    #     delivery_country: 'BE',
    #     delivery_drop_off_point_id: '006515',
    #   )
    #
    #   # Results in:
    #   {
    #     stat: '0',
    #     shipment_number: 'shipment number',
    #     agency_code: 'agency code',
    #     group: 'sorting group number',
    #     shuttle_run_number: 'shuttle run number',
    #     agency: 'agency name',
    #     delivery_run: 'delivery run',
    #     delivery_mode: 'delivery mode',
    #     bar_codes: {
    #       string: 'bar code',
    #     },
    #   }
    class Create < Operation
      operation_name :wsi2_creation_expedition
    end
  end
end
