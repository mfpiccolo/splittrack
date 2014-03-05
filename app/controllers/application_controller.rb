class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  # def correct_user?
  #   @user = User.find(params[:id])
  #   unless current_user == @user
  #     redirect_to login_path, :alert => "Access denied."
  #   end
  # end

  # def authenticate_user!
  #   if !current_user
  #     redirect_to login_path, :alert => 'You need to sign in for access to this page.'
  #   end
  # end
end
