class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :date_start, presence: true
  validates :date_end, presence: true
  validate :end_date_after_start_date
end
