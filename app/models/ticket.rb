class Ticket < ApplicationRecord
  belongs_to :end_station, class_name: "RailwayStation"
  belongs_to :start_station, class_name: "RailwayStation"
  belongs_to :train
  belongs_to :user
end
