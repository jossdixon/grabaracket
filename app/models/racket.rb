class Racket < ApplicationRecord
  belongs_to :user
  has_many :bookings

  enum grip_size: { L1: 0, L2: 1, L3: 2, L4: 3, L5: 4 }

  validates :brand, presence: true, length: { in: 2..10 }
  validates :model, presence: true, length: { minimum: 2 }
  validates :grip_size, presence: true
  validates :weight, presence: true, numericality: { in: 200..440 }
  validates :head_size, presence: true, numericality: { in: 78..130 }
end
