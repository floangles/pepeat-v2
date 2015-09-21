class PublicsController < ApplicationController


  def index
    @user = User.find(params[:format])
    @order = Order.new
  end


  def show
    @user = User.find(params[:id])
  end
end
