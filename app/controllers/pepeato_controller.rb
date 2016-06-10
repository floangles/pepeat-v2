class PepeatoController < ApplicationController

  def index
    @pepeatos = User.all.where(chief: true)
  end

end
