class ProfilesController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!


  def show
    @chief_picture = ChiefPicture.new
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

  def age(user)
    if @user.birth
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
      if params[:user][:stripe_account] == "true"

        @user.update(chief: 'true')
      end
      if params[:chiefpictures]
        params[:chiefpictures].each { |picture|
        @user.chief_pictures.create(chiefpicture: picture)
          }
      end
      if params[:user][:stripe_account] == "true" && ( @user.stripe == 'false' || @user.stripe == false || @user.stripe == nil)
        stripe = Stripe::Account.create(
          {
            country: "FR",
            managed: true,
            email: @user.email,
            legal_entity: {
              type: "individual",
              first_name: @user.firstname.upcase,
              last_name: @user.lastname.upcase,
              address: {
                city: params[:locality],
                line1: params[:street_number] + ' ' + params[:route],
                postal_code: params[:postal_code],
                state: params[:administrative_area_level_1]
              },
              personal_address: {
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
        @user.update(stripe_id: stripe.id, stripe: 'true')
        flash[:notice] = 'Félicitation, vous êtes désormais chef Pepeat !'

      elsif @user.stripe == 'true' || @user.stripe == true

        # Retrieve the stripe account

        account = Stripe::Account.retrieve(current_user.stripe_id)

        # update the stripe account informations for address

        if params[:locality] != ""

          account.legal_entity.address.city = params[:locality]
          account.legal_entity.address.line1 = params[:street_number] + ' ' + params[:route]
          account.legal_entity.address.postal_code = params[:postal_code]
          account.legal_entity.address.state = params[:administrative_area_level_1]

          account.legal_entity.personal_address.city = params[:locality]
          account.legal_entity.personal_address.line1 = params[:street_number] + ' ' + params[:route]
          account.legal_entity.personal_address.postal_code = params[:postal_code]
          account.legal_entity.personal_address.state = params[:administrative_area_level_1]
          account.save


        end
         flash[:notice] = 'Ton profil a bien été mis à jour'
      end

      redirect_to profile_path

    else
      render :edit
    end

  end

  def croping
    @picture = current_user.chief_pictures.find(params[:format])
  end

  def update_picture
    @user.update(picture_params)
    redirect_to profile_path
  end


  def crop_user

  end

  def update_bank_account
    token = params[:stripeToken]
    account = Stripe::Account.retrieve(current_user.stripe_id)
    if account.external_accounts.count == 0
      bank_account = account.external_accounts.create(external_account: token)
      @user.update(bank_account_id: bank_account.id)

      account.tos_acceptance.date = Time.now.to_i
      account.tos_acceptance.ip = request.remote_ip # Assumes you're not using a proxy
      account.save
      flash[:notice] = 'Votre compte a été ajouté avec succès'
    else
      bank_account = account.external_accounts.create(external_account: token, default_for_currency: 'true')
      account.external_accounts.retrieve(current_user.bank_account_id).delete
      @user.update(bank_account_id: bank_account.id)
      bank_account.save
      flash[:notice] = 'Votre compte a été changé avec succès'
    end
    redirect_to bank_account_profile_path
  end


  def rating
  end

  def set_user
    @user = current_user
  end


  def user_params
    params.require(:user).permit( :customer_id, :stripe_account, :stripe, :chief, :birth, :firstname, :phone_number, :surname, :lastname, :picture, :email, :address, :description, :chiefpicture, :picture_original_w, :picture_original_h, :picture_box_w, :picture_aspect, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h)
  end

  def picture_params
    params.require(:user).permit(:chiefpicture, :picture_original_w, :picture_original_h, :picture_box_w, :picture_aspect, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h)
  end


  def chief_params
    params.require(:user).permit(:chief)
  end

end
