class Calendar < ActiveRecord::Base
  
  acts_as_paranoid
  obfuscate_id :spin => 13889931

  validates :title, presence: true

  has_many :reservations, dependent: :destroy
  
  belongs_to :venue

  def title  	  	
    self.title = self[:title] == "default" ? I18n.t('views.legends.calendar.main_table', default: 'Main table') : self[:title]
  end
  
  def title_with_venue
    venue.name+ ' - '+ title
  end
end
