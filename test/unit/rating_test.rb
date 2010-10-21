require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_presence_of(:ratable_id)
  should validate_presence_of(:ratable_type)
  should_validate_numericality_of(:score)
  (0..5).each do |n|
    should allow_value(n).for(:score)
  end
  should_not allow_value(6).for(:score)
end
