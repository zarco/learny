class Experts::RegistrationsController < Devise::RegistrationsController
  # def new
  #   super
  # end

  # def create
  #   super
  # end
  private  
  def sign_up_params
    params.require(:expert).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params 
    regex_wbst = /\Awww\.(.+)\.(.+)$/ 
    regex_fb = /\Afacebook\.com\/(.+)$/
    regex_twtr = /\A@(.+)$/
    regex_gplus = /\A\+(.+)$/
    regex_lnkd = /\Aid=(\d+)$/

    fb_link = params[:expert][:facebook_link].delete(' ')
    twtr_link = params[:expert][:twitter_link].delete(' ')
    gplus_link = params[:expert][:google_plus_link].delete(' ')
    lnkd_link = params[:expert][:linkedin_link].delete(' ')
    wbst_link = params[:expert][:website].delete(' ')

    if regex_wbst.match(wbst_link)      
      params[:expert][:website] = "http://" << wbst_link
    else
      params[:expert][:website] = ""
    end

    if regex_fb.match(fb_link)
      params[:expert][:facebook_link] = "https://" << fb_link
    else
      params[:expert][:facebook_link] = ""
    end

    if regex_twtr.match(twtr_link)
      twtr_link.sub! '@', ''
      params[:expert][:twitter_link] = "https://twitter.com/" << twtr_link
    else
      params[:expert][:twitter_link] = ""
    end

    if regex_gplus.match(gplus_link)      
      params[:expert][:google_plus_link] = "https://plus.google.com/" << gplus_link
    else
      params[:expert][:google_plus_link] = ""
    end

    if regex_lnkd.match(lnkd_link)      
      params[:expert][:linkedin_link] = "https://www.linkedin.com/profile/view?" << lnkd_link
    else
      params[:expert][:linkedin_link] = ""
    end

    params.require(:expert).permit(:first_name, :last_name, :email, :password, :password_confirmation, 
      :current_password, :occupation, :profile, :avatar, :birthday, :genre, 
      :website, :facebook_link, :linkedin_link, :twitter_link, :google_plus_link, :areas_of_expertise)
  end

end
