class Plan < ActiveRecord::Base
  Status = [['計画中', 1], ['旅行中', 2], ['旅行記', 3]]

  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'
  has_many :destinations
  has_many :spots, :through => :destinations

  validates :title, :presence => true
  validates :status, :inclusion => { :in => 1..3 }

  normalize_attribute :title, :with => :strip
  logic_for_commentable
end
