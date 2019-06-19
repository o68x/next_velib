# frozen_string_literal: true

require 'httparty'

module HomeHelper
  def locate_search(search)
    # ! # FIXME: rescue that error somewhere
    raise ArgumentError, 'You must search for something' if search.blank?

    results = Geocoder.search(search)[0].data["features"]
    paris_only = results.select{ |city| city["properties"]["city"] == "Paris" }[0]
    return nil if paris_only.blank?

    {
      label: paris_only["properties"]["label"],
      coordinates: {
        lng: paris_only["geometry"]["coordinates"][0],
        lat: paris_only["geometry"]["coordinates"][1],
      }
    }
  end

  def locate_results(location)
    # location is array with longitude and latitude
    Station.near([location[:lat], location[:lng]], 1, units: :km)
           .where.not(free_bikes: 0).limit(5)
  end

  def walking_distance(distance)
    # Google says we're walking 4.8 km/h -> 1 km / 12.5 minutes
    (distance * 12.5).round(1)
  end
end
