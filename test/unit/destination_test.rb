require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  should "be valid" do
    assert Destination.new.valid?
  end
end
