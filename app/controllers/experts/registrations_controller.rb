class Experts::RegistrationsController < Devise::RegistrationsController
  # def new
  #   super
  # end

  # def create
  #   super
  # end
  private  
  def sign_up_params
    params.require(:expert).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
