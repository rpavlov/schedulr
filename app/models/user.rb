class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :listings

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :password
  validates_length_of :password, :minimum=> 8
  validates_format_of :email, :with => /@/
end
