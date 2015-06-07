Rails.application.config.before_initialize do
  # initialization code goes here
  
  DISQUS_SECRET_KEY = ENV['DISQUS_SECRET_KEY'] ? ENV['DISQUS_SECRET_KEY'] : '' 
  DISQUS_PUBLIC_KEY = ENV['DISQUS_PUBLIC_KEY'] ? ENV['DISQUS_PUBLIC_KEY'] : ''
  
  #puts "Disqus goes here #{DISQUS_SECRET_KEY} #{DISQUS_PUBLIC_KEY}!!!"
  
end