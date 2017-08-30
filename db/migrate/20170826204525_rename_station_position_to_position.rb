class RenameStationPositionToPosition < ActiveRecord::Migration[5.1]
  def change
    rename_column :railway_stations_routes, :station_position, :position
  end
end
