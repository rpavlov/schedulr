class ListingsController < ApplicationController
  before_action :set_listing, only:[:update]

  def index
    @available_listings = Listing.available
    @booked_listings = current_user.listings
  end
  
  def update
  end

  def refresh_listings
    @listings = Listing.all
    respond_to do |format|
      format.js
    end
  end
end
