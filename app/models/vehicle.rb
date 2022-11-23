class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :details, presence: true, length: { minimum: 20 }
  validates :vehicle_type, presence: true, inclusion: { in: ["bike", "e-bike", "cargo bike", "overboard", "scooter", "e-scooter", "e-unicycle"] }
  validates :price, presence: true, numericality: true
end
