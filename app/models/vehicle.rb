class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :details, presence: true, length: { minimum: 20 }
  validates :vehicle_type, presence: true, inclusion: { in: ["vélo", "vélo électrique", "vélo cargo", "overboard", "trottinette", "trottinette électrique", "gyroroue"] }
  validates :price, presence: true, numericality: true
end
