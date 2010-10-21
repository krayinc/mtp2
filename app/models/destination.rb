class Destination < ActiveRecord::Base
  acts_as_list :scope => :plan
  belongs_to :plan
  belongs_to :spot
end
