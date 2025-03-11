module BookingsHelper
  def booking_status_badge_class(status)
    case status.to_s.downcase
    when 'confirmed', 'approved', 'accepted'
      'bg-success'
    when 'pending', 'waiting'
      'bg-warning text-dark'
    when 'cancelled', 'rejected', 'declined'
      'bg-danger'
    when 'completed'
      'bg-info'
    else
      'bg-secondary'
    end
  end
end
