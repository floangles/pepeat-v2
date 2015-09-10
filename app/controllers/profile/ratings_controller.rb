module Profile
  class RatingsController < ApplicationController

    before_action :authenticate_user!

    def index
      @ratings = []
      current_user.meals.each do |meal|
        meal.orders.each do |order|
          @order = order
          @ratings << order.review
        end
      end
    end

  end
end
