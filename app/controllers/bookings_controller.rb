class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]
  before_action :check_booking_owner, only: [:destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = current_user
    @booking.status = "pending" if @booking.respond_to?(:status)

    @booking.date_start = Date.parse(params[:booking][:date_start]) if params[:booking][:date_start].is_a?(String)
    @booking.date_end = Date.parse(params[:booking][:date_end]) if params[:booking][:date_end].is_a?(String)

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking request was successfully submitted.'
    else
      flash.now[:alert] = "There was a problem with your booking: #{@booking.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def index
    @booking = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize_booking_access(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])

    # Only allow user to delete their own bookings
    if @booking.user != current_user
      redirect_to dashboard_path, alert: "You can only cancel your own bookings."
      return
    end

    if @booking.destroy
      redirect_to dashboard_path, notice: 'Booking was successfully cancelled.'
    else
      redirect_to dashboard_path, alert: 'Unable to cancel booking.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :special_requests)
  end

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def check_booking_owner
    unless @booking.user == current_user
      redirect_to dashboard_path, alert: 'You can only cancel your own bookings.'
    end
  end

  def authorize_booking_access(booking)
    # Users can view bookings they made or bookings for their listings
    unless booking.user == current_user || booking.listing.user == current_user
      redirect_to dashboard_path, alert: "You don't have permission to view this booking."
    end
  end
end
