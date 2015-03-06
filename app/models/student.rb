class Student < ActiveRecord::Base
  
  acts_as_paranoid

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

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
end
