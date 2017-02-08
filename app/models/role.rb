class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  def provider?
    self[:id]==1
  end
end
