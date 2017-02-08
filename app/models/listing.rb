class Listing < ActiveRecord::Base
  has_and_belongs_to_many :users
  validate :dates_valid
  scope :available, -> {where(available: true)}
  scope :booked, -> {where.not(available: true)}
  
  def booked_client
    users.select{ |user| !user.is_provider? }.first
  end

  def provider
    users.select{ |user| user.is_provider? }.first
  end

  def start_at_label
    start_at.strftime("%l:%M%p ")+start_at.strftime("%d-%m-%Y")
  end
  def end_at_label
    end_at.strftime("%l:%M %p ")+end_at.strftime("%d-%m-%Y")
  end
  
  def dates_valid
    if self[:end_at] < self[:start_at]
      errors[:start_at] << 'Start date cannot be past end date!'
    end
  end
end
