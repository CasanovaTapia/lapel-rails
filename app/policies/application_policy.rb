class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.present? && (record.user == user || user.liaison?)
  end

  def show?
    index?
  end

  def create?
    user.present? && (record.user == user || user.liaison?)
  end

  def new?
    create?
  end

  def update?
    user.present? && (user.liaison? || record.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    record.class
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
