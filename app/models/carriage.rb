class Carriage < ApplicationRecord
  TYPE_CLASS = %w[ CoupeCarriage EconomyCarriage SvCarriage ChairCarriage ]
  SEATS = %w[ bottom_seats top_seats side_top_seats side_bottom_seats chair_seats ]

  belongs_to :train

  before_validation :set_number

  validates :type, inclusion: { in: TYPE_CLASS, message: "%{value} is not a valid type of carriage" }
  SEATS.each do |seat|
    validates seat.to_sym, numericality: { greater_than_or_equal_to: 0 }
  end

  TYPE_CLASS.each do |type|
    type = type.downcase.sub('carriage', '')
    scope type.to_sym, -> { where(type: type) }
  end

  def self.total_seats(type, seats)
    send(type).sum(seats)
  end

  private

  def set_number
    self.number ||= train.carriages.maximum('number').to_i + 1
  end
end
