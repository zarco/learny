module ApplicationHelper
 def site_name
    "Learny"
  end

  def site_url
    if Rails.env.production?
      # Production URL
      "http://www.learny.me/"
    else
      # Our dev & test URL
      "http://localhost:3000"
    end
  end

  def meta_author
    "Learny Inc"
  end

  def meta_description
    "The best place to find the best teachers for those things you always wanted to learn!"
  end

  def meta_keywords
    "courses learny education"
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end

end
