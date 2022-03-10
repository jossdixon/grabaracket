class Borrow < ApplicationRecord
  belongs_to :users
  belongs_to :rackets

  enum status: { pending: 0, approved: 1, rejected: 2 }
end
