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

require 'rails_helper'

RSpec.describe Station, type: :model do
  it "has a valid factory" do
    expect(create(:station)).to be_valid
  end

  it { is_expected.to validate_presence_of(:sid) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_numericality_of(:latitude) }
  it { is_expected.to validate_numericality_of(:longitude) }
  it { is_expected.to validate_numericality_of(:free_bikes) }

  describe '#update_all_stations' do
    xit "should create or update database"
  end

  describe 'CityBikes HTTParty #get' do
    xit "should return a valid HTTParty object (json)"
  end
end
