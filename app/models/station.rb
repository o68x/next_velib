# frozen_string_literal: true

# == Schema Information
#
# Table name: stations
#
#  id         :bigint           not null, primary key
#  free_bikes :integer
#  latitude   :float
#  longitude  :float
#  name       :string
#  sid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_stations_on_latitude_and_longitude  (latitude,longitude)
#  index_stations_on_sid                     (sid)
#

# * # SEE: http://api.citybik.es/v2/networks/velib
# {
#   "network": {
#     ...
#     "stations": [
#       {
#         "empty_slots": 15,
#         "extra": {
#           "banking": false,
#           "bikes_overflow": 0,
#           "dueDate": 1557352800,
#           "ebikes": 1,
#           "ebikes_overflow": 0,
#           "has_ebikes": true,
#           "online": true,
#           "slots": 18,
#           "status": "Operative",
#           "uid": "18005"
#         },
#         "free_bikes": 3,
#         "id": "7321eda6529f6da9b6df36a4d1074102",
#         "latitude": 48.88414675978186,
#         "longitude": 2.3418454080820084,
#         "name": "Tardieu - Chappe",
#         "timestamp": "2019-06-17T18:31:21.439000Z"
#       }
#     ]
#   }
# }

class Station < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude

  validates :sid, presence: true, uniqueness: true
  validates :latitude,
            numericality: {
              greater_than: 48.75,
              less_than: 49.0
            }
  validates :longitude,
            numericality: {
              greater_than: 2.15,
              less_than: 2.55
            }
  validates :name, presence: true
  validates :free_bikes,
            presence: true,
            numericality: { only_integer: true }

  def self.update_all_stations
    @stations = self::CityBikes.new.stations["network"]["stations"]

    @stations.each do |s|
      puts s["name"]
      station_data = find_or_initialize_by(sid: s["id"]) do |station|
        station.name = s["name"]
        station.latitude = s["latitude"].to_f
        station.longitude = s["longitude"].to_f
        station.free_bikes = s["free_bikes"].to_i
      end
      station_data.update!(free_bikes: s["free_bikes"].to_i)
    rescue StandardError
      retry
    end
  end

  class CityBikes
    # get the whole directory of stations
    # use it to fill the whole database
    include HTTParty
    base_uri "http://api.citybik.es/v2/networks"

    def stations
      self.class.get("/velib")
    end
  end
end
