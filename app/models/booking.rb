class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :republica

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :status, presence: true
end
