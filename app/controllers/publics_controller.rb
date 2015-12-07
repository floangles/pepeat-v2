class PublicsController < ApplicationController


  def index
    @user = User.find(params[:format])
    @order = Order.new
  end


  def show
    @user = User.find(params[:id])
  end

  def faq
    pdf_filename = File.join(Rails.root, "app/assets/images/faq.pdf")
    send_file(pdf_filename, :filename => "FAQ", :disposition => 'inline', :type => "application/pdf")
  end


end
