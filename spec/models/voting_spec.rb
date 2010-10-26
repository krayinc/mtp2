require 'spec_helper'

describe Voting do
  context 'an instance' do
    subject do
      @voting = Voting.new
    end
    it { should respond_to(:user, :votable)}
  end
  
  context 'when save with empty attributes' do
    subject do
      voting = Voting.new
      voting.save
      voting
    end
    it { should have(1).error_on(:user_id) }
    it { should have(1).error_on(:votable_id) }
    it { should have(1).error_on(:votable_type) }
  end
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

