class Listing < ActiveRecord::Base
  has_and_belongs_to_many :users

  def price
    price.acts_as_dollars
  end
end
