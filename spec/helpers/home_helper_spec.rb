# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, type: :helper do
  describe '#locate_search' do
    xit 'should return a valid hash with a valid search'
    xit 'should return nil with a silly search'
    xit 'should return nil with an empty search'
  end

  describe '#locate_results' do
    xit 'should return an array of 5 stations'
  end

  describe '#walking_distance' do
    xit 'should convert km to walking distance'
  end
end
