class Plan < ActiveRecord::Base
  
  logic_for_commentable
  logic_for_votable
  logic_for_rankable
  
  Status = [['計画中', 1], ['旅行中', 2], ['旅行記', 3]]

  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'
  has_many :destinations, :order => 'position ASC'
  has_many :spots, :through => :destinations
  belongs_to :photo, :class_name => 'SpotPhoto', :foreign_key => 'photo_id'

  def photos
    SpotPhoto.where(:id => DestinationPhoto.where(:destination_id => self.destinations.map(&:id)).map(&:photo_id))
  end

  validates :title, :presence => true
  validates :status, :inclusion => { :in => 1..3 }

  normalize_attribute :title, :with => [:strip, :blank]
  
  scope :popular, order_by_rank

  def self.pickup
    self.find(SiteConfig[:pickup_plan_id].to_i)
  rescue
    self.find(:first, :offset => (self.count * rand).to_i)
  end
  
  def first_spot
    self.destinations.first.spot
  rescue
    nil
  end
  
  def calculate_point(time_range)
    return self.comments.where(:created_at => time_range).count + 
           self.votings.where(:created_at => time_range).count
  end
  
end

# == Schema Information
#
# Table name: plans
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  title      :string(255)     not null
#  status     :integer(1)      not null
#  outline    :text
#  created_at :datetime
#  updated_at :datetime
#  public     :boolean         default(FALSE), not null
#

