# frozen_string_literal: true

class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string  :sid, index: true
      t.string  :name
      t.float   :latitude
      t.float   :longitude
      t.integer :free_bikes

      t.timestamps
    end
    # * # SEE: https://github.com/alexreisner/geocoder#performance-and-optimization
    add_index :stations, [:latitude, :longitude]
  end
end
