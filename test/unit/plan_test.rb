require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  should "be valid" do
    assert Plan.new.valid?
  end
end
