class Students::RegistrationsController < Devise::RegistrationsController
  
  
  private 
  def account_update_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :occupation, :profile, :avatar)
  end
  
  
end
