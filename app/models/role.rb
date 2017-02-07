class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  def is_provider?
    id == 1
  end
end
