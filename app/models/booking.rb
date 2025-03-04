class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # Define status as an enum (easier to read and write than strings)
  enum status: {
    pending: 'pending',
    confirmed: 'confirmed',
    canceled: 'canceled',
    completed: 'completed'
  }

  # Validations
  validates :date_start, presence: true
  validates :date_end, presence: true
  validate :end_date_after_start_date

  def end_date_after_start_date
    return if date_end.blank? || date_start.blank?

    if date_end < date_start
      errors.add(:date_end, "must be after the start date")
    end
  end
end
