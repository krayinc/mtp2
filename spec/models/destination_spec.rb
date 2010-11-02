require 'spec_helper'

describe Destination do
  context 'Destination belongs to Plan' do
    fixtures :plans, :destinations
    subject { destinations(:one) }
    its(:plan) { should == plans(:one) }
  end
end

# == Schema Information
#
# Table name: destinations
#
#  id         :integer         not null, primary key
#  position   :integer
#  plan_id    :integer         not null
#  spot_id    :integer         not null
#  comment    :text
#  time       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
