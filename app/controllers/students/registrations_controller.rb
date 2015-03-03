class Students::RegistrationsController < Devise::RegistrationsController
  def update

    self.resource = Student.find(current_student.to_param)
    #self.resource=Student.where(id: current_student.id).first
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)    

    resource_updated = resource.update_with_password(account_update_params)
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation,
    :birthday, :genre,:current_password, :occupation, :profile, :avatar)
  end

end
