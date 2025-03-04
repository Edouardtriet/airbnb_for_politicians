class OfferingsController < ApplicationController
  def index
    @offerings = Offering.all
  end

  def show
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
  end

  def create
    @offering = Offering.new(params[:offering])
    if @offering.save
      redirect_to offering_path(@offering), notice: 'Offering was successfully created.'
    else
      render :new
    end
  end

  def edit
    @offering = Offering.find(params[:id])
  end

  def update
    @offering = Offering.find(params[:id])
    @offering.update(params[:offering])
  end

  def destroy
    @offering = Offering.find(params[:id])
    @offering.destroy
    redirect_to offerings_path, status: :see_other
  end

  private

  def offering_params
    params.require(:offering).permit(:name, :type, :price, :location, :availability_start, :availability_end, :picture)
  end
end
