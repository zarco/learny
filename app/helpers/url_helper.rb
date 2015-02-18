module UrlHelper
  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end
  
  def url_for_twitter(profile)
  	/^http/i.match(profile) ? url : "http://twitter.com/#{profile}"
  end

  def ur_for_google_plus(profile)
  	/^http/i.match(profile) ? url : "http://plus.google.com/#{profile}"
  end
end