require 'spec_helper'

describe Plan do
  context 'an new instance' do
    subject do
      plan = Plan.new
    end
    it { should respond_to(:votings)}
    it { should respond_to(:vote!).with(1).argument }
    it { should respond_to(:unvote!).with(1).argument }
    it { should respond_to(:total_votes).with(0).arguments }
    it { should respond_to(:voted_by?).with(1).argument }
  end
  
  context 'when save with empty attributes' do
    subject do
      plan  = Plan.new
      plan.save
      plan
    end
    it { should have(1).error_on(:title) }
  end
  
  context 'an instance' do
    before :each do
      @user = Factory(:user)
      @plan = Factory(:plan)
    end
    subject { @plan}
    it 'Voting count should change by 1 when vote' do
      lambda {
        subject.vote!(@user)
      }.should change(Voting, :count).by(1)
    end
  end
  
  describe 'When a user has voted' do
    before :each do
      @user = Factory(:user)
      @plan = Factory(:plan)
      Factory(:voting, :user => @user, :votable => @plan)
    end
    subject { @plan }
    context 'voted_by?(already_voted_user)' do
      it { subject.voted_by?(@user).should be_true }
    end
    its(:total_votes) { should == 1}
    it 'Voting count should change by -1 when unvote' do
      lambda {
        subject.unvote!(@user)
      }.should change(Voting, :count).by(-1)
    end
  end
  
end

# == Schema Information
#
# Table name: plans
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  title      :string(255)     not null
#  status     :integer(1)      not null
#  outline    :text
#  created_at :datetime
#  updated_at :datetime
#  public     :boolean         default(FALSE), not null
#

