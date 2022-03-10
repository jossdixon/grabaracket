class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rackets
  has_many :bookings

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true
  validates :address, presence: true, length: { minimum: 10 }
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
