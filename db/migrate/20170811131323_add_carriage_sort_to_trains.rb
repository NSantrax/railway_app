class AddCarriageSortToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :car_sort, :boolean, default: true
  end
end
