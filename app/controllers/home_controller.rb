# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :check_stations_cache

  def index
    @search = params[:q]
    @location = helpers.locate(@search) unless @search.nil?
    puts @location[:results]
  end

  private

  def check_stations_cache
    # checks how old the db is, refreshes it if needed
    Rails.cache.fetch([cache_key, __method__], expires_in: 10.minutes) do
      puts "Refreshing or what?", "#" * 50
      Station.update_all_stations
    end
  end
end
