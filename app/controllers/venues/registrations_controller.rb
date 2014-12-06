class Venues::RegistrationsController < Devise::RegistrationsController
  # def new
  #   super
  # end
  def create
    super do |resource|
      resource.calendars.create(:title => "default", :is_default => true) if resource.persisted?
    end
  end
  
  
  private
  
  def sign_up_params
    params.require(:venue).permit(:name, :email, :password, :password_confirmation)
  end
  
end
