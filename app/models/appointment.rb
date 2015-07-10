class Appointment < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :datetime, :location
end
