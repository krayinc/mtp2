require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should belong_to(:commenter)
  should validate_presence_of(:commenter_id)
  should validate_presence_of(:commentable_id)
  should validate_presence_of(:commentable_type)
  should validate_presence_of(:body)
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

