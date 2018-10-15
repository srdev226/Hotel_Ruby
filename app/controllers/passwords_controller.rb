class PasswordsController < Devise::RegistrationsController
  
  def resource_params
  	params.require(resource_name).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
  end

  private :resource_params

end