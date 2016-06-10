class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :pages_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_commission
  after_filter :store_location
  def set_commission
    @client = 0.15
    @chief = 0.04
    @client_amount = 1.15
  end

  # Uncomment these lines to get pundit
  include Pundit
  after_action :verify_authorized, except:  :index, unless: :devise_or_pages_or_admin_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_or_admin_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :chief
  end

  private

  def devise_or_pages_or_admin_controller?
    devise_controller? || pages_controller? || params[:controller] =~ /^admin/
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end


  def pages_controller?
    controller_name == "pages" || "meals"  # Brought by the `high_voltage` gem
  end

  def user_not_authorized
    flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end
end
