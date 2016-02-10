class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:update_user]
  before_action :authenticate_user!, only: [:update_user]
  before_action :is_chief?, only: [:update_user]


  def is_chief?
    if current_user.chief?
      true
    else
      redirect_to page_path('chief_infos'), notice: "Vous devez vous inscrire en tant que Pepeato pour participer à l'événement SharingLille"
    end
  end

  def index
    @user = current_user
    @pepeatos = User.where(chief: true)

  end


  def update_user
    @user = current_user
    @user.update(ouishare: true)
    redirect_to events_path, notice: "Féliciation, vous êtes officiellement inscrit à l'événement SharingLille, Nous vous contacterons sous peu !"
  end
end
