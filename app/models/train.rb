class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: "RailwayStation"
  has_many :tickets
end