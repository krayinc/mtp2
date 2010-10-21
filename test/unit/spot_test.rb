require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  should "be valid" do
    assert Spot.new.valid?
  end
end
