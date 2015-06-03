module WorkshopsHelper

	require 'rubygems'
	require 'base64'
	require 'cgi'
	require 'openssl'
	require "json"
	 
	DISQUS_SECRET_KEY = 'bWrU6cMaqBkIhKkRcWHnRUZcJU3QDlT9oAIXmqOkbqIGNxHY3gtL2CLR9gxs8LOG'
	DISQUS_PUBLIC_KEY = 'WxvhqqQdGUrEC9j7MprxEIbGUHQRue1AubhqIMqSYQJRYcSnuC6MEBirRfNOJUkA'

	def random_workshop
	  
	  #puts ">>>> #{Workshop.count}"
	  
	  workshop=Workshop.select(:name).limit(1).order("random()").first
		workshop.nil? ? '' : workshop.name		
	end

	def small_description_profile(description,total_words=300)
    	truncate(description,length: total_words,separator: ' ')
  	end
 
	def get_disqus_sso(user)
    # create a JSON packet of our data attributes
    if !user.avatar_url.nil?
	    data = 	{	    	
	      'id' => user.id,
	      'username' => user.full_name,
	      'email' => user.email,
	      'avatar' => user.avatar.icon.url
	    }.to_json
	   else
	   	data = 	{	    	
	      'id' => user.id,
	      'username' => user.full_name,
	      'email' => user.email
	    }.to_json
	   end
 
    # encode the data to base64
    message  = Base64.encode64(data).gsub("\n", "")
    # generate a timestamp for signing the message
    timestamp = Time.now.to_i
    # generate our hmac signature
    sig = OpenSSL::HMAC.hexdigest('sha1', DISQUS_SECRET_KEY, '%s %s' % [message, timestamp])
 
    # return a script tag to insert the sso message
    return "<script type=\"text/javascript\">
        var disqus_config = function() {
            this.page.remote_auth_s3 = \"#{message} #{sig} #{timestamp}\";
            this.page.api_key = \"#{DISQUS_PUBLIC_KEY}\";
        }</script>"
	end
end
