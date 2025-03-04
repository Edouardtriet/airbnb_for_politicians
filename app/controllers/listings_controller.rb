class ListingsController < ApplicationController
  def index
    @listings = Listing.all  # This is correct
  end

  def show
    @listing = Listing.find(params[:id])  # Changed 'listing' to 'Listing'
  end

  def new
    @listing = Listing.new  # Changed 'listing' to 'Listing'
  end

  def create
    @listing = Listing.new(listing_params)  # Changed 'listing' to 'Listing' and params[:listing] to listing_params
    if @listing.save
      redirect_to listing_path(@listing), notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])  # Changed 'listing' to 'Listing'
  end

  def update
    @listing = Listing.find(params[:id])  # Changed 'listing' to 'Listing'
    @listing.update(listing_params)  # Changed params[:listing] to listing_params
  end

  def destroy
    @listing = Listing.find(params[:id])  # Changed 'listing' to 'Listing'
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :type_of_event, :price, :location, :availability_start, :availability_end, :picture)
    # Changed :type to :type_of_event to match your renamed column
  end
end
