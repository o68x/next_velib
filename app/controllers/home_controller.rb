# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :check_stations_cache

  def index
    @search = params[:q]
    # returns hash with :label and :coordinates
    @location = helpers.locate_search(@search) unless @search.nil?
    @stations = helpers.locate_results(@location[:coordinates]) unless @location.nil?
  end

  def check_stations_cache
    # checks how old the db is, refreshes it if needed
    Rails.cache.fetch(:stations, expires_in: 1.minute) do
      StationWorker.perform_async
    end
  end
end
