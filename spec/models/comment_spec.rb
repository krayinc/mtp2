require 'spec_helper'

describe Comment do
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

