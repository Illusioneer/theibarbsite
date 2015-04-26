class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :require_auth
  
  private
    def current_user
      begin
        @current_user = User.where(user_id: session[:user_id]).first if session[:user_id]
        nil
      end
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @current_user = User.where(user_id: session[:user_id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end
    
    def require_auth
        unless user_signed_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to articles_url
        end
      end
end
