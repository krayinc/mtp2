class Spot < ActiveRecord::Base
  logic_for_ratable
  logic_for_rankable

  scope :popluar, order_by_rank

  has_many :destinations, :dependent => :restrict

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

