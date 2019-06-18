# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :check_stations_cache

  def index
    @search = params[:q]
    # returns hash with :label and :coordinates
    @location = helpers.locate_search(@search) unless @search.nil?
    @stations = helpers.locate_results(@location[:coordinates])
  end

  def check_stations_cache
    # checks how old the db is, refreshes it if needed
    Rails.cache.fetch(:stations, expires_in: 10.minutes) do
      # Update db if last API call older than 2 minutes
      Station.update_all_stations
    end
    # render 'index'
  end
end
