require "rails_helper"

RSpec.describe ListingsController, :type => :controller do
  describe "Client Listings Controller" do
    it "books a listing" do
    end
    it "can cancel a listing already cancelled by the provider" do
    end
    it "can cancel a listing already cancelled and then deleted by the provider" do
    end
    it "does not book a listing someone else has already booked" do
    end
    it "does not book a listing that has been deleted" do
    end
    it "does not book a listing if user already has another listing in the same time-slot" do
    end
    it "fetches the correct listings for this user" do
    end
    it "only fetches available listings whose start_at is in the future" do
    end
  end
  describe "Provider Listings Controller" do
    it "cannot create a listing with start_at > end_at" do
    end
    it "cannot create a listing lasting under an hour" do
    end
    it "cannot create a listing with start_at in the past" do
    end
    it "cannot create a listing with overlapping timeblocks" do
    end
    it "can cancel a listing" do
    end
    it "can delete an available listing" do
    end
    it "fetches the correct listings for this user" do
    end
    it "ensures dates don't overlap aka can't create double-booking"do
    end
  end
end
