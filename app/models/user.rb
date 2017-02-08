class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :listings
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /@/
  validates_presence_of :name

  def is_provider?
    roles.first.provider?
  end
end
