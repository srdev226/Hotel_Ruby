class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_listings_label
  #after_filter :store_location


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception



  def after_sign_in_path_for(resource)
      #sign_in(resource)
    if current_user
      puts "TEST"
      puts session[:previous_url]
      puts stored_location_for(resource)
      puts params[:booking]
      unless current_user.purchase_intent.nil?
        listing_path(current_user.purchase_intent)
      else
       session[:previous_url] || new_user_listing_path(current_user)
      end
    elsif current_admin
      admin_path
    elsif current_buyer
      session[:previous_url]
    end

  end

  def set_listings_label
    @view_listings_label =
      if admin_signed_in? && Listing.any?
        "View listings"
      elsif user_signed_in? && current_user.listings.present?
        "View your listings"
      end
  end



def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get?
  if (request.path != "/sellers/sign_in" &&
      request.path != "/sellers/sign_up" &&
      request.path != "/sellers/password/new" &&
      request.path != "/sellers/password/edit" &&
      request.path != "/sellers/confirmation" &&
      request.path != "/sellers/sign_out" &&
      request.path != "/buyers/sign_in" &&
      request.path != "/buyers/sign_up" &&
      request.path != "/buyers/password/new" &&
      request.path != "/buyers/password/edit" &&
      request.path != "/buyers/confirmation" &&
      request.path != "/buyers/sign_out" &&
      request.path != "/users/sign_in" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :purchase_intent])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end
  
end







