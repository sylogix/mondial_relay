# frozen_string_literal: true

#  Operations:
#   :wsi2_adresse_point_relais,
#   :wsi2_creation_etiquette,
#   :wsi2_creation_expedition,
#   :wsi2_detail_point_relais,
#   :wsi3_get_etiquettes,
#   :wsi2_recherche_cp,
#   :wsi4_recherche_point_relais,
#   :wsi3_point_relais_recherche,
#   :wsi2_recherche_point_relais_avancee,
#   :wsi2_recherche_point_relais_horaires,
#   :wsi2_stat_label,
#   :wsi2_stat_labels,
#   :wsi2_tracing_colis_detaille,

module MondialRelay
  class Request
    attr_reader :operation, :params

    def initialize(operation, params = {})
      @operation = operation
      @params = params.reject { |_, val| val.size.zero? }
    end

    def attributes
      { xmlns: MondialRelay.config.api_url }
    end

    def message
      merchant_id
        .merge(params)
        .merge(security_code)
    end

    private

    def merchant_id
      { Enseigne: MondialRelay.config.merchant_id }
    end

    def security_code
      { Security: SecurityCode.for(params.values) }
    end
  end
end
