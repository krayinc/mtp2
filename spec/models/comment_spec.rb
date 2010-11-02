require 'spec_helper'

describe Comment do
  context 'an instance' do
    subject { Comment.new }
    it { should respond_to(:commentable, :commenter) }
  end
  
  context 'when save with empty attributes' do
    subject do
      comment = Comment.new
      comment.save
      comment
    end
    it { should have(1).error_on(:commenter_id) }
    it { should have(1).error_on(:commentable_id) }
    it { should have(1).error_on(:commentable_type) } 
  end

  context 'body size' do
    subject do
      comment = Comment.new(:body => 'value for body')
      comment.body.size
    end
    it {should >= 1}
    it {should <= 140}
  end
end

# == Schema Information
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  commenter_id     :integer         not null
#  commentable_id   :integer         not null
#  commentable_type :string(255)     not null
#  body             :string(140)     not null
#  created_at       :datetime
#  updated_at       :datetime
#

