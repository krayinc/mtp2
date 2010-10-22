require 'spec_helper'

describe Spot do
  
  context 'an instance' do
    subject do
      @rating = Spot.new
    end
    it { should respond_to(:ratings)}
    it { should respond_to(:rate).with(2).arguments }
    it { should respond_to(:average_rating).with(0).arguments }
    it { should respond_to(:rated_by?).with(1).argument }
  end
  
  
end
