class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :details, presence: true, length: { minimum: 20 }
  validates :vehicle_type, presence: true, inclusion: { in: ["bike", "e-bike", "cargo bike", "overboard", "scooter", "e-scooter", "e-unicycle"] }
  validates :street_number, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :price, presence: true, numericality: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_city?

  def address
    [street_number, street, zipcode, city].compact.join(", ")
  end
end
