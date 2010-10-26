class Plan < ActiveRecord::Base
  Status = [['計画中', 1], ['旅行中', 2], ['旅行記', 3]]

  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'
  has_many :destinations
  has_many :spots, :through => :destinations

  validates :title, :presence => true
  validates :status, :inclusion => { :in => 1..3 }

  normalize_attribute :title, :with => :strip
  logic_for_commentable
  logic_for_votable
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

