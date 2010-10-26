class Voting < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, :polymorphic => true
  
  validates_presence_of     :user_id, :votable_id, :votable_type
  validates_uniqueness_of   :user_id, 
                            :scope => [:votable_id, :votable_type]
end

# == Schema Information
#
# Table name: votings
#
#  id           :integer         not null, primary key
#  user_id      :integer         not null
#  votable_id   :integer         not null
#  votable_type :string(255)     not null
#  dimension    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

