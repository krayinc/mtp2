require 'spec_helper'

describe Spot do
  
  context 'an instance' do
    subject do
      @rating = Spot.new
    end
    it { should respond_to(:ratings)}
    it { should respond_to(:ratings_count)}
    it { should respond_to(:rate!).with(2).arguments }
    it { should respond_to(:average_rating).with(0).arguments }
    it { should respond_to(:rated_by?).with(1).argument }
  end
  
  context 'when save with empty attributes' do
    subject do
      spot = Spot.new
      spot.save
      spot
    end
    it { should have(1).error_on(:name) }
  end
  
  context 'with have no ratings' do
    subject { spot = Factory(:spot) }
    its(:ratings) { should be_empty }
    its(:ratings_count) { should == 0 }
    its(:average_rating) { should == 0 }
  end
  
  context 'with have 5 ratings (1 to 5 points)' do
    before do
      @spot = Factory(:spot)
      (1..5).each do |n|
        @spot.rate!(n, Factory(:user))
      end
    end
    subject { @spot }
    its(:ratings_count) { should == 5 }
    its(:average_rating) { should == 3 }
  end
  
end

# == Schema Information
#
# Table name: spots
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  latitude   :string(255)     not null
#  longitude  :string(255)     not null
#  address    :string(255)     not null
#  annotation :text
#  created_at :datetime
#  updated_at :datetime
#
