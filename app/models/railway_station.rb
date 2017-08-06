class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.station_position").uniq }

  def update_position(route, position)
    railway_stations_routes.find_by(route).update(station_position: position)
  end
end
