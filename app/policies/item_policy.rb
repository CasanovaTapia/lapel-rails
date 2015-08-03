class ItemPolicy < ApplicationPolicy
  def update?
    user.present? && user.liaison?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
