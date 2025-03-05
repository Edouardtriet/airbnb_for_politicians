class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    # ADDED: This line is needed to associate the listing with the current user
    @listing.user = current_user

    if @listing.save
      redirect_to listing_path(@listing), notice: 'Listing was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # REMOVED: @listing = Listing.find(params[:id])
    # This is now handled by the before_action :set_listing

    # CHANGE: Added if/else structure to handle failed updates
    if @listing.update(listing_params)
      redirect_to listing_path(@listing), notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
      # Find the listing (handled by before_action :set_listing)
      # Check if current user owns this listing
    if @listing.user == current_user
      @listing.destroy
      redirect_to listings_path, notice: 'Listing was successfully deleted.'
    else
      # User doesn't own this listing
      redirect_to listings_path, alert: 'You can only delete your own listings.'
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :type_of_event, :price, :location, :availability_start, :availability_end, :picture)
    # Changed :type to :type_of_event to match your renamed column
  end
end
