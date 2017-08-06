class SvCarriage < Carriage
  validates :top_seats, :side_bottom_seats, :side_top_seats, :chair_seats, numericality: { equal_to: 0 }
end
