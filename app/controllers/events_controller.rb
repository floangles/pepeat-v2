class EventsController < ApplicationController

  def index
    @user = current_user
    @pepeatos = User.where(chief: true)

  end
end
