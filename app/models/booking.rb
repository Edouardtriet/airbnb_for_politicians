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
end
