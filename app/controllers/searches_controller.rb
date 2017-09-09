class SearchesController < ApplicationController
  before_action :set_stations, only: [:create]

  def show
  end

  def create
    @routes = RailwayStation.find_routes(@start_station, @end_station)
    render :show
  end

  private

    def set_stations
      @start_station = RailwayStation.find(params[:start_station_id])
      @end_station   = RailwayStation.find(params[:end_station_id])
    end
end
