class Carriage < ApplicationRecord
  TYPE_CLASS = %w[ coupe platscard ]
  belongs_to :train

  validates :type_class, inclusion: { in: TYPE_CLASS, message: "%{value} is not a valid type of carriage" }
  validates :bottom_seats, numericality: { greater_than_or_equal_to: 0}
  validates :top_seats, numericality: { greater_than_or_equal_to: 0}

  scope :coupe, -> { where(type_class: 'coupe') }
  scope :platscart, -> { where(type_class: 'platscart') }
end
