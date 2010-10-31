require 'spec_helper'

describe Voting do
  context 'an instance' do
    subject do
      @voting = Voting.new
    end
    it { should respond_to(:user, :votable) }
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

  context 'when creating a duplicate rating' do
    it do
      @valid_attributes = {
        :user_id =>'value for user', 
        :votable_id =>'value for votable_id',
        :votable_type => 'value for votable_type'
      }
      
      Voting.create!(@valid_attributes)
      Voting.new(@valid_attributes).should be_invalid
    end
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

