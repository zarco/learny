class GuestsController < ApplicationController
  
	def index			
	end

	def create    
		@guest = Guest.create(guest_params)				
		@workshop_solicited = params[:guest][:workshop]
		respond_to do |format|
	    if @guest.persisted?
	      format.html { redirect_to root_path, notice: I18n.t('views.legends.guest.suggested_successfully',default: 'Thanks, You will be notified when we have your course.') }
	    else            
	      format.html { render :index}
	      format.json { render json: @guest.errors, status: :unprocessable_entity }
	    end
		end
	end

  def guest_params
    params.require(:guest).permit(:name, :email, :workshop)
  end
end