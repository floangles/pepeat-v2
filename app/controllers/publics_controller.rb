class PublicsController < ApplicationController

  def index
    @user = User.find(params[:format])
    @order = Order.new

    @markers = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.picture({
       "url" => "/assets/marker.png",
       "width" =>  0,
       "height" => 0,
       })
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def faq
    pdf_filename = File.join(Rails.root, "app/assets/images/faq.pdf")
    send_file(pdf_filename, :filename => "FAQ", :disposition => 'inline', :type => "application/pdf")
  end

  def photo
    pdf_filename = File.join(Rails.root, "app/assets/images/photo.pdf")
    send_file(pdf_filename, :filename => "photo", :disposition => 'inline', :type => "application/pdf")
  end

end
