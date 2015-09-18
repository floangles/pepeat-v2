class PublicsController < ApplicationController


  def index
    @user = User.find(params[:format])
  end
end
