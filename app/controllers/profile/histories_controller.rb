module Profile

  class HistoriesController < ApplicationController

     before_action :authenticate_user!

    def index
      @users = User.all
      @orders = current_user.orders.all
      @markers = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
      end
    end

  end

end
