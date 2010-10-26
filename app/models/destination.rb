class Destination < ActiveRecord::Base
  acts_as_list :scope => :plan
  belongs_to :plan
  belongs_to :spot
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

