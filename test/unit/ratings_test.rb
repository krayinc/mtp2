require 'test_helper'

class RatingsTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_presence_of(:ratable_id)
  should validate_presence_of(:ratable_type)
  should_validate_numericality_of(:score)
  
  (0..5).each do |n|
    should allow_value(n).for(:score)
  end
  should_not allow_value(6).for(:score)
  
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

