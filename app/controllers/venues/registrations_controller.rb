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
        params[:venue_pictures].each { |image|
          @venue.venue_pictures.create!(avatar: image, :venue_id => @venue.id)
        }
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
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
    params.require(:venue).permit(:name, :email, :map_link, :facilities, :venue_pictures)
  end
end
