class PublicsController < ApplicationController


  def index
    @user = User.find(params[:format])
    @order = Order.new
  end
end
