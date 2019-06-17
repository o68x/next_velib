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
#  index_stations_on_sid  (sid)
#

require 'rails_helper'

RSpec.describe Station, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
