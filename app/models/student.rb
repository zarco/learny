class Student < ActiveRecord::Base
  
  acts_as_paranoid
  obfuscate_id :spin => 19238931

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  #Added to make carrierwave works with ofuscation
  def find_previous_model_for_avatar
    self.class.find(to_param)
  end


  has_many :enrollments
  has_many :workshops, through: :enrollments
  def full_name
    first_name + ' ' + last_name
  end

  def next_workshops(number=6)
    workshops.joins(:reservation)
    .where('reservations.starts_at > ?', DateTime.now)
    .order('reservations.starts_at')
    .limit(number)
  end

  def previous_workshops(number=6)
    workshops.joins(:reservation)
    .where('reservations.starts_at < ?', DateTime.now )
    .order('reservations.starts_at desc')
    .limit(number)
  end

  def self.create_with_omniauth(auth)
    create! do |student|
      student.provider = auth.provider
      student.uid = auth.uid
      if auth.provider == 'facebook' 
        student.first_name = auth.extra.raw_info.first_name
        student.last_name = auth.extra.raw_info.last_name
        student.email = auth.info.email
      elsif auth.provider == 'twitter'
        student.first_name = auth.extra.raw_info.name
        student.email = auth.uid + '@twitter.com'       
        student.last_name = 'Student'
      end
      student.password = Devise.friendly_token[0,20]
      student.skip_confirmation!
    end
  end

  #def update(params)
  #  if params[:password].blank?
  #    params.delete(:password)
  #    params.delete(:password_confirmation) if params[:password_confirmation].blank?
  #  end
  #  result=update_attributes(params)
  #  clean_up_passwords
  #  result
  #end

end
