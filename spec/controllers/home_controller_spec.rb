# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    xit 'use my home adress if no search'
  end

  describe '#check_stations_cache' do
    xit 'launch a sidekiq task to refresh db if too old'
  end
end
