class SessionsController < ApplicationController	
	module Users
		STUDENT = 1
		EXPERT = 2
		VENUE = 3	
	end
	def create
	  u = request.env["omniauth.params"]["u"].to_i
	  auth = request.env["omniauth.auth"]
	  provider = auth["provider"]
	  user = Student.find_by_provider_and_uid(provider, auth["uid"]) || Student.create_with_omniauth(auth) if u == Users::STUDENT
	  user = Expert.find_by_provider_and_uid(provider, auth["uid"]) || Expert.create_with_omniauth(auth) if u == Users::EXPERT
	  user = Venue.find_by_provider_and_uid(provider, auth["uid"]) || Venue.create_with_omniauth(auth) if u == Users::VENUE
	  if user
	  	@student = user if u == Users::STUDENT
		  @expert = user if u == Users::EXPERT
		  @venue = user if u == Users::VENUE		  
	    flash[:notice] = I18n.t('views.legends.signed_up_successfully_social_network', provider: provider.capitalize, default: 'You have signed up successfully')
			sign_in_and_redirect @student, :event => :authentication if u == Users::STUDENT
			sign_in_and_redirect @expert, :event => :authentication if u == Users::EXPERT
			sign_in_and_redirect @venue, :event => :authentication if u == Users::VENUE
	  else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_student_registration_url if u == Users::STUDENT
      redirect_to new_expert_registration_url if u == Users::EXPERT
      redirect_to new_venue_registration_url if u == Users::VENUE
    end
	end
end