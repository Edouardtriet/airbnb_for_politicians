class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end

  def dashboard
    @user = current_user
    @listings = @user.listings if @user
    @bookings = @user.bookings if @user
    @received_bookings = Booking.joins(:listing).where(listings: { user_id: @user.id }) if @user

    # If you want to debug, place it INSIDE the method
    Rails.logger.debug "Current user in dashboard action: #{current_user.inspect}"
  end
end
