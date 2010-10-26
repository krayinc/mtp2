require 'spec_helper'

describe Voting do
  pending "add some examples to (or delete) #{__FILE__}"
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

