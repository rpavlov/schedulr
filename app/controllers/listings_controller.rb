class ListingsController < ApplicationController
  before_action :set_listing, only:[:book, :cancel]
  before_action :fetch_listings, only:[:index, :refresh_listings]
  helper_method :is_double_booked?
  def index
  end
  def book
    if @listing
      @listing.update(available: false, users: @listing.users << current_user)
    end
    fetch_listings
    respond_to do |format|
      format.js { render "refresh_listings" }
    end
  end
  def cancel
    if @listing
      @listing.update(available: true, users: @listing.users.select{ |user| user.is_provider? })
    end
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
  def is_double_booked?(listing_arg)
    current_user.listings.map{ |listing| (listing.start_at..listing.end_at).overlaps?(listing_arg.start_at..listing_arg.end_at)}.any?
  end
  private
  def set_listing
    begin
      @listing = Listing.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "It appears this listing was removed. Sorry!"
    end
  end
  def fetch_listings
    @available_listings = Listing.available.in_the_future.sort_by(&:start_at)
    @booked_listings = current_user.listings
  end
end
