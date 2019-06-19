# frozen_string_literal: true

class StationWorker
  include Sidekiq::Worker

  def perform
    Station.update_all_stations
  end
end
