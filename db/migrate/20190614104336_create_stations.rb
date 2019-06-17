# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      # * # TODO: Fill this table with data from API call
      # * # TODO: Update on interval (sidekik scheduler)
      t.string  :sid, index: true
      t.string  :name
      t.float   :latitude
      t.float   :longitude
      t.integer :free_bikes

      t.timestamps
    end
  end
end
