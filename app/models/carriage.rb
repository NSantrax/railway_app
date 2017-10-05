class Carriage < ApplicationRecord
  CARRIAGE_TYPES = %w[ CoupeCarriage EconomyCarriage SvCarriage ChairCarriage ]
  SEATS = %w[ bottom_seats top_seats side_top_seats side_bottom_seats chair_seats ]

  belongs_to :train

  before_validation :set_number

  validates :type, inclusion: { in: CARRIAGE_TYPES, message: "%{value} is not a valid type of carriage" }
  validates :number, uniqueness: { scope: :train_id }

  SEATS.each do |seat|
    validates seat.to_sym, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  end

  scope :car_sort, ->(train) { train.car_sort ? order("number ASC") : order("number DESC") }

  CARRIAGE_TYPES.each do |type|
    scope type.downcase.sub("carriage", "").to_sym, -> { where(type: type) }
  end

  private

    def set_number
      self.number ||= train.carriages.maximum("number").to_i + 1
    end
end
