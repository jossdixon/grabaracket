class Racket < ApplicationRecord
  belongs_to :user

  enum grip_size: { L1: 0, L2: 1, L3: 2, L4: 3, L5: 4 }
end
