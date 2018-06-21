class ApplicationController < ActionController::Base
  
   include Pundit
   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  protect_from_forgery with: :exception

  # before_action :get_subdomain

# prevents current_user from ever returning a nil value (not logged in user)
  def current_user
    # super = use the devise current_user method || create a new open struct with 1 attr of full name
    super || OpenStruct.new(full_name: 'Guest')
  end

  private 

  def user_not_authorized
    flash[:alert] = " You are not authorized to access this page"
    redirect_to(request.referrer || root_path)
  end

    # def get_subdomain
    #   puts "The Subdomain is:"
    #   puts request.subdomain
    #   raise
    # end

end
