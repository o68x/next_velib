# frozen_string_literal: true

module HomeHelper
  def select_location(search)
    results = Geocoder.search(search)[0].data["features"]
    # binding.pry
    results.select{ |city| city["properties"]["city"] == "Paris" }
  end
end
