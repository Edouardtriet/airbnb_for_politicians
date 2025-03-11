# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user! # Ensures only logged-in users can access the dashboard

  def profile
    @user = current_user # Get the current logged-in user
    @listings = current_user.listings # Get all listings owned by the current user
    @bookings = current_user.bookings # Get all bookings made by the current user
    @received_bookings = Booking.joins(:listing).where(listings: { user_id: current_user.id }) # Get bookings made for user's listings
  end
end
