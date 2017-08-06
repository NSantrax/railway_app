class EconomyCarriage < Carriage
  validates :chair_seats, numericality: { equal_to: 0 }
end
