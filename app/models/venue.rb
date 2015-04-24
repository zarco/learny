class Venue < ActiveRecord::Base
    
  acts_as_paranoid

  include Rails.application.routes.url_helpers
  
  obfuscate_id :spin => 13208931
  
  mount_uploader :avatar, AvatarUploader
  #Added to make carrierwave works with ofuscation
  def find_previous_model_for_avatar
    self.class.find(to_param)
  end
  
  
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :website, :allow_blank => true, format: { with: /\Awww\.(.+)\.(.+)$\z/, message: "no valido" }
  validates :facebook_link, :allow_blank => true, format: { with: /\Afacebook\.com\/(.+)$\z/, message: "no valido" }
  validates :twitter_link, :allow_blank => true, format: { with: /\A@(.+)$\z/, message: "no valido" }
  validates :google_plus_link, :allow_blank => true, format: { with: /\A\+(.+)$\z/, message: "no valido" }
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  belongs_to :zone
         
  has_many :calendars
  has_many :venue_pictures
  has_one :contact
  
  has_many :reservations, through: :calendars
  
  accepts_nested_attributes_for :venue_pictures, :contact
  

  def next_workshops(number=6)
    Workshop.joins(:reservation, :calendar)
      .where('reservations.starts_at > ? AND venue_id = ?', DateTime.now, self.id )
      .order('reservations.starts_at')
      .limit(number)   
  end  
end
