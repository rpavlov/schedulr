class Listing < ActiveRecord::Base
  has_and_belongs_to_many :users
  validate :dates_valid
  #scope :booked_by, -> {joins(:users).where(users: {roles: Role.})}
  def price
    price.acts_as_dollars
  end

  def dates_valid
    if self[:end_at] < self[:start_at]
      errors[:start_at] << 'Start date cannot be past end date!'
    end
  end
end
