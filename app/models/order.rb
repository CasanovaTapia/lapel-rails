class Order < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :status, :delivery
end
