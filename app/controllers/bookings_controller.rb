class BookingsController < ApplicationController
  before_action :set_listing, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])
    @booking.listing = @listing
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking request was successfully submitted.'
    else
      render :new
    end
  end

  def index
    @booking = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :name)
  end

  def set_listing
    @listing = listing.find(params[:listing_id])
  end
end
