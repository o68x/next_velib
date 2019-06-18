# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :check_stations_cache

  def index
    @search = params[:q]
    @location = helpers.locate(@search) unless @search.nil?
    # puts @location[:results]
  end

  def check_stations_cache
    # checks how old the db is, refreshes it if needed
    Rails.cache.fetch(:stations, expires_in: 120.seconds) do
      # Update db if last API call older than 2 minutes
      Station.update_all_stations
    end
    # render 'index'
  end
end
