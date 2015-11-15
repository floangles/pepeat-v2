class ProfilesController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!


  def show
    @chief_picture = ChiefPicture.new
  end

  def age(user)
    if user.birth
      DateTime.now.year - user.birth.year
    end
  end



  def edit
    skip_authorization
  end

  def update
    skip_authorization
    @user.update(user_params)
    if @user.save
     if params[:chiefpictures]
        params[:chiefpictures].each { |picture|
        @user.chief_pictures.create(chiefpicture: picture)
          }
    end

      if params[:user][:stripe_account] == "true" && @user.stripe == nil
        stripe = Stripe::Account.create(
          {
            country: "FR",
            managed: true,
            email: @user.email,
            legal_entity: {
              type: "individual",
              first_name: @user.firstname,
              last_name: @user.lastname,
              address: {
                city: params[:locality],
                line1: params[:street_number] + ' ' + params[:route],
                postal_code: params[:postal_code],
                state: params[:administrative_area_level_1]
              },
              dob: {
                day: @user.birth.day,
                month: @user.birth.month,
                year: @user.birth.year
              }
            }
          }
        )
        @user.update(uid: stripe.id, stripe: 'true')
      end


      redirect_to profile_path

    else
      render :edit
    end

  end

  def croping
    @picture = current_user.chief_pictures.find(params[:format])
  end

  def update_bank_account

    account = Stripe::Account.retrieve(current_user.uid)
    account.external_accounts.create(external_account: stripeToken)

    redirect_to profile_path
  end


  def rating
  end

  def set_user
    @user = current_user
  end


  def user_params
    params.require(:user).permit( :customer_id, :stripe_account, :stripe, :chief, :birth, :firstname, :phone_number, :surname, :lastname, :picture, :email, :address, :description, :chiefpicture, :picture_original_w, :picture_original_h, :picture_box_w, :picture_aspect, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h)
  end


  def chief_params
    params.require(:user).permit(:chief)
  end

end
