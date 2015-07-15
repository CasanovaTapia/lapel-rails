class AppointmentPolicy < ApplicationPolicy
  def index?
    record.user == user || user.liaison?
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
