# frozen_string_literal: true

class StationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    Station.update_all_stations
  end
end
