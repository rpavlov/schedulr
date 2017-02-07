class Listing < ActiveRecord::Base
  belongs_to :user

  def price
    price.acts_as_dollars
  end
end
