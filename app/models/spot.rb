class Spot < ActiveRecord::Base
  has_many :ratings, :as => :ratable
  
  def rate(score, user_or_user_id)
    rating = Rating.new(:ratable => self)
    rating.user_id = get_user_id(user_or_user_id)
    rating.score = score
    rating.save
  end
  
  def average_rating
    self.ratings.average(:score)
  end
  
  def rated_by?(user_or_user_id)
    self.ratings.exists?(['user_id = ?', get_user_id(user_or_user_id)])
  end
  
  def get_user_id(user_or_user_id)
    if user_or_user_id.kind_of?(User)
      user_id = user_or_user_id.id
    elsif user_or_user_id.kind_of?(Integer)
      user_id = user_or_user_id
    end
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

