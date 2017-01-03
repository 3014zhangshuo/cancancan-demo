class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  check_authorization if: :admin_subdomain?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end
  # not have permission to send message friendly to user


  private

  def admin_subdomain?
    request.subdomain == "admin"
  end

  def current_user
    User.new(session[:id])
  end

  helper_method :current_user

end
