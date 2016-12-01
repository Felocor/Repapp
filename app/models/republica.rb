class Republica < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 10


  validates :address, presence: true
 # validates :zip_code, presence: true
  validates :description, presence: true
  validates :vacancies, presence: true
  validates :city, presence: true
 # validates :country, presence: true
  validates :name, presence: true, uniqueness: {scope: :city}
  validates :photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
