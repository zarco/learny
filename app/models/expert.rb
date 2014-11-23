class Expert < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  
  has_many :workshops

  def full_name
    first_name + ' ' + last_name
  end

end
