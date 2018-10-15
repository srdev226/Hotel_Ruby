class RegistrationsController < Devise::RegistrationsController


   def create
     super do |resource|
        #BuyerMailer.buyer_signup(resource).deliver if resource.persisted? && resource.type == 'buyer'
        session[:booking] = params[:booking]
     end
   end

  def resource_params
  	params.require(resource_name).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
  end

  private :resource_params

  protected
  # customize after_sign_in_path_for
  def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def after_sign_up_path_for(resource)
    sign_in(resource)

    #@new_user = User.last
     # Sends email to user when user is created

    # if current_seller
    #   new_listing_path
    #if current_user
      #new_listing_path
      #elsif current_admin
      #admin_path 

    # elsif current_buyer
    #   session[:previous_url]

      # BuyerMailer.buyer_signup(resource).deliver_now
      #end
  end

end

