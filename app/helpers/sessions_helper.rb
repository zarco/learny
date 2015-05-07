module SessionsHelper
	def signed_up_with_social_network?(user)
		! user.provider.nil?
	end
end
