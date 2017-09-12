class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_event_time(route, event, time)
    station_route = station_route(route)
    station_route.update("#{event}_time".to_sym => time) if station_route
  end

  def event_time(route, event)
    station_route(route).try("#{event}_time".to_sym)
  end

  def self.find_routes(station1, station2)
    return if station1 == station2
    station1.routes & station2.routes
  end

  protected

    def station_route(route)
      @station_route ||= railway_stations_routes.where(route: route).first
    end
end
