class Student < ActiveRecord::Base

  obfuscate_id :spin => 19238931
  #encrypted_id key: '5gA6lgr9o3GOg7EOQ1caRT'

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  #Added due to ofuscation 
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
