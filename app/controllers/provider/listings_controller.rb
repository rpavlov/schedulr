class Provider::ListingsController < ApplicationController
  before_action :check_role
  
  def index
    @booked_listings = current_user.listings
    
    @open_listings = current_user.listings
  end
  def new
    @listing = Listing.new
  end
  def create
    @listing = current_user.listings.build(listing_params)
    respond_to do |format|
      if @listing.save
        byebug
        format.html { redirect_to provider_listings_path, notice: 'Listing was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def update
  end

  def refresh_listings
    @listings = Listing.all
    respond_to do |format|
      format.js
    end
  end

  def listing_params
    params.require(:listing).permit(:start_at, :end_at)
  end
end
