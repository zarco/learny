class Genre
  
  def self.all
    values=['M', 'F']
    options=Array.new
    options.push(['',''])
    values.each do |key|
      i='views.genres.'.concat(key)
      options.push( [I18n.t(i ,default: key), key] )
    end
    return options
  end
  
end