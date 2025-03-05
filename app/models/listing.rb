class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :image
  validates :name, presence: true
  # validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true

  enum type_of_event: {
    speech: 'speech',
    dinner: 'dinner',
    meeting: 'meeting',
    debate: 'debate',
    fundraising: 'fundraising',
    other: 'other'
  }
end
