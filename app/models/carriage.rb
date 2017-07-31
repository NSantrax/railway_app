class Carriage < ApplicationRecord
  TYPE_CLASS = %w[ coupe platscart ]
  belongs_to :train

  validates :type_class, inclusion: { in: TYPE_CLASS, message: "%{value} is not a valid type of carriage" }
  validates :bottom_seats, numericality: { greater_than_or_equal_to: 0}
  validates :top_seats, numericality: { greater_than_or_equal_to: 0}

  TYPE_CLASS.each do |type|
    scope type.to_sym, -> { where(type_class: type) }
  end

  def self.total_seats(type,seats)
    send(type).sum(seats)
  end
end
