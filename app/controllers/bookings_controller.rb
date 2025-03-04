class BookingsController < ApplicationController
  before_action :set_offering, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])
    @booking.offering = @offering
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

  def set_offering
    @offering = Offering.find(params[:offering_id])
  end
end
