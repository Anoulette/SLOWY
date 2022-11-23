class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :date, presence: true
  validates_uniqueness_of :date, scope: :vehicle
end
