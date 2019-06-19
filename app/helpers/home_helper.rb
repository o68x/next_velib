# frozen_string_literal: true

module HomeHelper
  def locate_search(search)
    results = Geocoder.search(search)[0].data["features"]
    paris_only = results.select{ |city| city["properties"]["city"] == "Paris" }[0]
    return nil if paris_only.blank?

    {
      label: paris_only["properties"]["label"],
      # change geocoder array to hash for securiy
      coordinates: {
        lng: paris_only["geometry"]["coordinates"][0],
        lat: paris_only["geometry"]["coordinates"][1],
      }
    }
  end

  def locate_results(location)
    # location is array with longitude and latitude
    Station.near([location[:lat], location[:lng]], 2, units: :km)
           .where.not(free_bikes: 0).limit(5)
  end

  def walking_distance(distance)
    # Google says we're walking 4.8 km/h -> 1 km / 12.5 minutes
    (distance * 12.5).round(1)
  end
end
