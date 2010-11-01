class Spot < ActiveRecord::Base
  logic_for_ratable
  logic_for_rankable

  scope :popluar, order_by_rank

  has_many :destinations, :dependent => :restrict

  normalize_attribute :name, :with => [:half_width, :strip, :blank]
  normalize_attribute :name, :with => [:half_width, :strip, :blank]
  normalize_attribute :name, :with => [:half_width, :strip, :blank]

  validates :name,      :presence => true
  validates :latitude,  :presence => true, :latitude  => true
  validates :longitude, :presence => true, :longitude => true

  def calculate_point(time_range)
    return self.ratings.where(:updated_at => time_range).average(:score) || 0
  end
end

# == Schema Information
#
# Table name: spots
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  latitude   :string(255)     not null
#  longitude  :string(255)     not null
#  address    :string(255)     not null
#  annotation :text
#  created_at :datetime
#  updated_at :datetime
#

