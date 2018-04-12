# frozen_string_literal: true

module MondialRelay
  module DropOffPoints
    class Search
      class Translations
        PARAMS = {
          country: :Pays,
          drop_off_point_id: :NumPointRelais,
          city: :Ville,
          postal_code: :CP,
          latitude: :Latitude,
          longitude: :Longitude,
          parcel_size: :Taille,
          parcel_weight: :Poids,
          delivery_mode: :Action,
          lead_time: :DelaiEnvoi,
          search_radius: :RayonRecherche,
          trade_type: :TypeActivite,
          nance: :NACE,
          number_of_results: :NombreResultats,
        }.freeze
      end
    end
  end
end
