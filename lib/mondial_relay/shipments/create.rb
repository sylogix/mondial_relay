# frozen_string_literal: true

module MondialRelay
  module Shipments
    # An interface for *shipment* creation.
    # Requests the {https://api.mondialrelay.com/Web_Services.asmx?op=WSI2_CreationExpedition
    # WSI2_CreationExpedition} endpoint.
    #
    # Available creation params (*M* — mandatory, *O* — optional):
    #
    # - **ModeCol** — collection mode `^(CCC|CDR|CDS|REL)$` *M*.
    # - **ModeLiv** — delivery mode `^(LCC|LD1|LDS|24R|24L|24X|24C|ESP|DRI)$` *M*.
    # - **NDossier** — merchant shipment reference (e.g invoice number) *O*.
    # - **NClient** — consignee reference *O*.
    # - **Expe_Langage** — sender's language *M*.
    # - **Expe_Ad1** — sender's particulars, name, first name *M*.
    # - **Expe_Ad2** — sender's other name information *O*.
    # - **Expe_Ad3** — sender's street *M*.
    # - **Expe_Ad4** — sender's extra address information *O*.
    # - **Expe_Ville** — sender's city *M*.
    # - **Expe_CP** — sender's zip code *M*.
    # - **Expe_Pays** — sender's country code (ISO) *M*.
    # - **Expe_Tel1** — sender's phone number *M*.
    # - **Expe_Tel2** — sender's cell number *O*.
    # - **Expe_Mail** — sender's email address *O*.
    # - **Dest_Langage** — consignee's language *M*.
    # - **Dest_Ad1** — consignee's particulars, name, first name *M*.
    # - **Dest_Ad2** — consignee's other name information *O*.
    # - **Dest_Ad3** — consignee's street *M*.
    # - **Dest_Ad4** — consignee's extra address information *O*.
    # - **Dest_Ville** — consignee's city *M*.
    # - **Dest_CP** — consignee's zip code *M*.
    # - **Dest_Pays** — consignee's country code (ISO) *M*.
    # - **Dest_Tel1** — consignee's phone number (obligatory for home delivery) *O/M*.
    # - **Dest_Tel2** — consignee's cell phone *O*.
    # - **Dest_Mail** — consignee's email address *O*.
    # - **Poids** — weight (in grams) *M*.
    # - **Longueur** — length (in cm) *O*.
    # - **Taille** — leave empty *O*.
    # - **NbColis** — number of parcels in shipment *M*.
    # - **CRT_Valeur** — COD shipment value (in cents) *M*.
    # - **CRT_Devise** — currency of COD value (EUR) *O*.
    # - **Exp_Valeur** — shipment value (in cents) *O*.
    # - **Exp_Devise** — currency of shipment value (EUR) *O*.
    # - **COL_Rel_Pays** — pickup point country code (ISO) *O/M*.
    #   Obligatory if collected at Point Relais.
    # - **COL_Rel** — pickup point ID *O/M*.
    #   Obligatory if collected at Point Relais.
    # - **LIV_Rel_Pays** — drop-off point country code (ISO) *O/M*.
    #   Obligatory if delivered at Point Relais.
    # - **LIV_Rel** — drop-off point ID *O/M*.
    #   Obligatory if delivered at Point Relais.
    # - **TAvisage** — notification request for shipment `^(|O|N)$` *O*.
    # - **TReprise** — `^(|O|N)$` *O*.
    # - **Montage** — assembly time *O*. Zero by default.
    # - **TRDV** — request for delivery appointment `^(|O|N)$` *O*.
    # - **Assurance** — insurance coverage *O*. Zero by default.
    # - **Instructions** — extra information *O*.
    #
    # **NOTE**: all params must be provided in the order specified above.
    #
    # @example
    #   # Create a shipment and return its number with some extra information:
    #   MondialRelay::Shipments::Create.for(
    #     ModeCol: 'REL',
    #     ModeLiv: '24R',
    #     Expe_Langage: 'FR',
    #     Expe_Ad1: 'Test Sender',
    #     Expe_Ad3: '38 Route de Rennes',
    #     Expe_Ville: 'Nantes',
    #     Expe_CP: '44300',
    #     Expe_Pays: 'FR',
    #     Expe_Tel1: '+3300000000',
    #     Dest_Langage: 'FR',
    #     Dest_Ad1: 'Test Consignee',
    #     Dest_Ad3: 'Bouwhandelstraat 94-138',
    #     Dest_Ville: 'Antwerpen',
    #     Dest_CP: '2140',
    #     Dest_Pays: 'BE',
    #     Poids: '500',
    #     NbColis: '1',
    #     CRT_Valeur: '30',
    #     COL_Rel_Pays: 'FR',
    #     COL_Rel: '094170',
    #     LIV_Rel_Pays: 'BE',
    #     LIV_Rel: '006515',
    #   )
    #
    #   # Results in:
    #   {
    #     stat: '0',
    #     expedition_num: 'shipment number',
    #     tri_agence_code: 'agency code',
    #     tri_groupe: 'sorting group number',
    #     tri_navette: 'shuttle run number',
    #     tri_agence: 'agency name',
    #     tri_tournee_code: 'delivery run',
    #     tri_livraison_mode: 'delivery mode',
    #     codes_barres: {
    #       string: 'bar code',
    #     },
    #   }
    class Create < Operation
      OPERATION = :wsi2_creation_expedition

      # @!visibility private
      def run
        MondialRelay::Query.run(OPERATION, translated_params)
      end
    end
  end
end
