class Ratings < ActiveRecord::Base
  validates_presence_of :user_id, :ratable_id, :ratable_type
  validates_numericality_of :score, 
                            :greater_than_or_equal_to => 0, 
                            :less_than_or_equal_to => 5
end

# == Schema Information
#
# Table name: ratings
#
#  id           :integer         not null, primary key
#  user_id      :integer         not null
#  ratable_id   :integer         not null
#  ratable_type :string(255)     not null
#  score        :integer         default(0), not null
#  dimension    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

