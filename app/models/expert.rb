class Expert < ActiveRecord::Base

  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :website, :allow_blank => true, format: { with: /\Awww\.(.+)\.(.+)$\z/, message: "no valido" }
  validates :facebook_link, :allow_blank => true, format: { with: /\Afacebook\.com\/(.+)$\z/, message: "no valido" }
  validates :twitter_link, :allow_blank => true, format: { with: /\A@(.+)$\z/, message: "no valido" }
  validates :google_plus_link, :allow_blank => true, format: { with: /\A\+(.+)$\z/, message: "no valido" }
  validates :linkedin_link, :allow_blank => true, format: { with: /\Aid=(\d+)$\z/, message: "no valido" }

  has_many :workshops

  mount_uploader :avatar, AvatarUploader

  after_validation :concate_url
  def concate_url
    self.website = "http://" << self.website unless self.website.blank?
    self.facebook_link = "https://" << self.facebook_link unless self.facebook_link.blank?
    self.twitter_link = "https://twitter.com/" << self.twitter_link.gsub('@', '') unless self.twitter_link.blank?
    self.google_plus_link = "https://plus.google.com/" << self.google_plus_link unless self.google_plus_link.blank?
    self.linkedin_link = "https://www.linkedin.com/profile/view?" << self.linkedin_link unless self.linkedin_link.blank?
  end

  def fmt_website
    self.website = self.website.gsub('http://','') if self.website?
  end

  def fmt_facebook_link
    self.facebook_link = self.facebook_link.gsub('https://','') if self.facebook_link?
  end

  def fmt_twitter_link
    self.twitter_link = self.twitter_link.gsub('https://twitter.com/','@') if self.twitter_link?
  end

  def fmt_google_plus_link
    self.google_plus_link = self.google_plus_link.gsub('https://plus.google.com/','') if self.google_plus_link?
  end

  def fmt_linkedin_link
    self.linkedin_link = self.linkedin_link.gsub('https://www.linkedin.com/profile/view?','') if self.linkedin_link?
  end

  def next_workshops(number=6)
    workshops.joins(:reservation)
    .where('reservations.starts_at > ?', DateTime.now )
    .order('reservations.starts_at')
    .limit(number)
  end

  def previous_workshops(number=6)
    workshops.joins(:reservation)
    .where('reservations.starts_at < ?', DateTime.now )
    .order('reservations.starts_at desc')
    .limit(number)
  end

  def full_name
    first_name + ' ' + last_name
  end

end
