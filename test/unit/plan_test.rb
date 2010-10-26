require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  should "be valid" do
    assert Plan.new.valid?
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

