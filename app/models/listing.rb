class Listing < ActiveRecord::Base
  has_and_belongs_to_many :users
  validate :dates_valid
  validate :no_double_booking, :on => :create
  scope :available, -> {where(available: true)}
  scope :in_the_future, -> {where("start_at > ?", DateTime.now)}
  scope :booked, -> {where.not(available: true)}
  
  def client
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
      errors[:start_at] << ': Start date cannot be past end date!'
    end
    if ((self[:end_at]- self[:start_at])*24*60).to_i < 60
      errors[:start_at] << ": Timeslot must be at least 1 hour in length."
    end
    if self[:start_at] < DateTime.now
      errors[:start_at] << ': Start date cannot be in the past!'
    end
  end
  def in_the_past?
    start_at < DateTime.now
  end
  def no_double_booking
    if users.collect.map(&:listings).flatten.map{ |listing| (listing.start_at..listing.end_at).overlaps?(self[:start_at]..self[:end_at])}.any?
      errors[:start_at] << ": Dates overlap with one or more of your existing listings!"
    end
  end  
end
