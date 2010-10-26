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
  
  context 'when creating a duplicate rating' do
    pending
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

