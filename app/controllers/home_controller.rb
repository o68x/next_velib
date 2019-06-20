# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :check_stations_cache

  def index
    @search = params[:q] || '4 rue Chappe'
    # returns hash with :label and :coordinates
    return if @search.blank?

    @location = helpers.locate_search(@search)
    return if @location.blank?

    @stations = helpers.locate_results(@location[:coordinates])
  end

  def check_stations_cache
    # checks how old the db is, refreshes it if needed
    Rails.cache.fetch(:stations, expires_in: 5.minutes) do
      StationWorker.perform_async
    end
  end
end
