class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :route_id, :railway_station_id, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
