class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :listings
  accepts_nested_attributes_for :roles
  accepts_nested_attributes_for :listings

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /@/
  validates_presence_of :name
  validates_presence_of :password
  validates_length_of :password, :minimum=> 8

  
  def is_provider?
    roles.pluck(:id).include? 1
  end
end
