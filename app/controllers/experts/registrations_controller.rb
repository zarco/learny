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

  def account_update_params
    params.require(:expert).permit(:first_name, :last_name, :email, :password, :password_confirmation, 
      :current_password, :occupation, :profile, :avatar, :birthday, :genre, 
      :website, :facebook_link, :linkedin_link, :twitter_link, :google_plus_link, :areas_of_expertise)
  end

end
