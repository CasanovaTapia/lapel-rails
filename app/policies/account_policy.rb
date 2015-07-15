class AccountPolicy < ApplicationPolicy
  def create?
    user.present? && user.liaison?
  end

  def update?
    create?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
