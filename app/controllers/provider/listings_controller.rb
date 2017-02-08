class Provider::ListingsController < ApplicationController
  before_action :set_listing, only:[:destroy, :update]
  before_action :fetch_listings, only:[:index, :refresh_listings]
  def index    
  end
  def new
    @listing = Listing.new
  end
  def create
    @listing = Listing.new(listing_params)
    @listing.users << current_user
    respond_to do |format|
      if @listing.save
        format.html { redirect_to provider_listings_path, notice: 'Listing was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def refresh_listings
    respond_to do |format|
      format.js
    end
  end
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to provider_listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
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

  private
  def set_listing
    @listing = Listing.find(params[:id])
  end
  def fetch_listings
    @booked_listings = current_user.listings.booked
    @available_listings = current_user.listings.available
  end
end
