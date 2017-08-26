class ChairCarriage < Carriage
  validates :bottom_seats, :top_seats, :side_bottom_seats, :side_top_seats, numericality: { equal_to: 0 }
end
