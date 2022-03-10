class Racket < ApplicationRecord
  belongs_to :user
  has_many :bookings

  enum grip_size: { L1: 0, L2: 1, L3: 2, L4: 3, L5: 4 }

  validates :brand, presence: true, length: { in: 3..10 }
  validates :model, presence: true, length: { minimum: 3 }
  validates :grip_size, presence: true
  validates :weight, presence: true
  validates_numericality_of :weight,
    only_integer: true,
    greater_than_or_equal_to: 200,
    less_than_or_equal_to: 440,
    message: "Unstrung weight in grams."
  validates :head_size, presence: true
  validates_numericality_of :head_size,
    only_integer: true,
    greater_than_or_equal_to: 80,
    less_than_or_equal_to: 130,
    message: "Head size in square inches."
end
