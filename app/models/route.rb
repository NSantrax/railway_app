class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true

  def update_station_position(station, position)
    railway_stations_routes.find_by(station).update(station_position: position)
  end
end
