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

FactoryBot.define do
  factory :station do
    sid { Faker::Internet.password(32) }
    name { "#{Faker::Ancient.primordial} - #{Faker::Ancient.hero}" }
    latitude { 48.881991 }
    longitude { 2.371773 }
    free_bikes { Random.rand(1..8) }
  end
end
