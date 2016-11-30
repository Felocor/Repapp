class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :republica

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :status, presence: true

  def find_bookings_by_user(user_id)

  end
end

