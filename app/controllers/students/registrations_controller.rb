class Students::RegistrationsController < Learny::RegistrationsController
  

  private

  def sign_up_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation,
    :birthday, :genre,:current_password, :occupation, :profile, :avatar)
  end

end
