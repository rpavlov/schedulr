class ListingsController < ApplicationController
  before_action :set_listing, only:[:book, :cancel]
  before_action :fetch_listings, only:[:index, :refresh_listings]
  def index
  end
  def update
  end

  def book
    @listing.available=false
    @listing.users << current_user
    @listing.save
    fetch_listings
    respond_to do |format|
      format.js { render "refresh_listings" }
    end
  end
  def cancel
    @listing.available=true
    @listing.users = @listing.users.select{ |user| user.is_provider? }
    @listing.save
    fetch_listings
    respond_to do |format|
      format.js { render "refresh_listings" }
    end
  end

  def refresh_listings
    respond_to do |format|
      format.js
    end
  end

  private
  def set_listing
    @listing=Listing.find(params[:id])
  end
  def fetch_listings
    @available_listings = Listing.available
    @booked_listings = current_user.listings
  end
end
