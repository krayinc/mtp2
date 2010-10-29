require 'spec_helper'

describe Rating do
  
  context 'an instance' do
    subject do
      @rating = Rating.new
    end
    it { should respond_to(:user, :ratable)}
  end
  
  context 'when save with empty attributes' do
    subject do
      rating = Rating.new
      rating.save
      rating
    end
    it { should have(1).error_on(:user_id) }
    it { should have(1).error_on(:ratable_id) }
    it { should have(1).error_on(:ratable_type) }
  end
  
  context 'when rated by 3 point' do
    before do 
      @user = Factory(:user)
      @ratable = Factory(:spot)
      @ratable.rate!(3, @user)
      @rating = Rating.last
    end
    subject { Rating.last }
    its(:score) { should == 3 }
    context 'and rate from same user with 5 point' do
      subject { lambda { @ratable.rate!(5, @user) } }
      it 'should not change Rating.count' do
         should_not change(Rating, :count) 
      end
      it 'rating#score should have been changed to 5 from 3' do
        should change { Rating.last.score }.from(3).to(5) 
      end
    end
  end
  
end

# == Schema Information
#
# Table name: ratings
#
#  id           :integer         not null, primary key
#  user_id      :integer         not null
#  ratable_id   :integer         not null
#  ratable_type :string(255)     not null
#  score        :integer         default(0), not null
#  dimension    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

