# frozen_string_literal: true

require 'httparty'

module HomeHelper
  def locate(search)
    # ! # TODO: rescue that error somewhere
    raise ArgumentError, 'You must search for something' if search.blank?

    results = Geocoder.search(search)[0].data["features"]
    # binding.pry
    paris_only = results.select{ |city| city["properties"]["city"] == "Paris" }[0]
    {
      label: paris_only["properties"]["label"],
      coordinates: paris_only["geometry"]["coordinates"],
      results: VelibMetropole.new(paris_only["geometry"]["coordinates"])
    }
  end

  class VelibMetropole
    include HTTParty
    base_uri "https://www.velib-metropole.fr"

    def initialize(coordinates)
      long   = coordinates[0]
      lat    = coordinates[1]
      radius = 0.005

      @options = {
        query: {
          gpsTopLatitude: lat.to_f + radius,
          gpsTopLongitude: long.to_f + radius,
          gpsBotLatitude: lat.to_f - radius,
          gpsBotLongitude: long.to_f - radius,
          zoomLevel: 19
        }
      }
    end

    def stations
      self.class.get("/webapi/map/details", @options)
    end
  end
end
