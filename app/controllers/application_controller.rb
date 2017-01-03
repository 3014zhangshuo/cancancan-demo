class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end
  # not have permission to send message friendly to user


  private

  def current_user
    User.new(session[:id])
  end

  helper_method :current_user

end
