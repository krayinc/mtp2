class Voting < ActiveRecord::Base
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

