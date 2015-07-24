class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :appointment_status

  validates_presence_of :datetime, :location

  def status
    appointment_status.name
  end
end
