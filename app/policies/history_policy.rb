class HistoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


  def index
    true
  end

  def show
  end
end
