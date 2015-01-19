class Venues::RegistrationsController < Devise::RegistrationsController
  # def new
  #   super
  # end
  def create
    super do |resource|
      resource.calendars.create(:title => "default", :is_default => true) if resource.persisted?
    end
  end
  
  def update
    respond_to do |format|
      if @venue.update(account_update_params)
        if params[:venue_pictures].present?
          params[:venue_pictures].each { |image|
            @venue.venue_pictures.create!(avatar: image, :venue_id => @venue.id)
          }
        end
        format.html { redirect_to @venue, :notice => I18n.t('devise.registrations.updated', default: 'Update has been sucessfull.') }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  
  private
  
  def sign_up_params
    params.require(:venue).permit(:name, :email, :password, :password_confirmation)
  end
  
  def account_update_params
    params.require(:venue).permit(:name, :description, :address, :business_hours, :email, 
      :map_link, :facilities, :avatar, :venue_pictures, :contact_attributes  => [ :name, :mail, :phone ])
  end
end
