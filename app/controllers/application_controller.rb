class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required
    rescue_from MyCustomError, with: :show_custom_error_page
    
    private
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def login_required
        redirect_to login_path unless current_user
    end
    
    def require_admin
        # redirect_to login_path unless current_user.admin?
        raise MyCustomError unless current_user.admin?
    end
    
    def show_custom_error_page(error)
        @error = error
        render template: "layouts/exceptions/custom_error"
    end

end

