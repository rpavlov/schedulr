class ListingsController < ApplicationController
  before_filter :check_role
  
  def index
    @listings = Listing.all
  end
  def new
    @listing = Listing.new
  end
  def create
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
