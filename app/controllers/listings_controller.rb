class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  def refresh_listings
    @listings = Listing.all
    respond_to do |format|
      format.js
    end
  end
end
