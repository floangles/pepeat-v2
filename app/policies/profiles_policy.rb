class ProfilesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show
  end

  def update?
    record.user == user
  end


end
