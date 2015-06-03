# try not to put too much in here - use Policy Objects if possible
# http://eng.joingrouper.com/blog/2014/03/20/rails-the-missing-parts-policies/
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # TODO setup rescue page
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_path, :alert => exception.message
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, roles: [])}
  end
end
