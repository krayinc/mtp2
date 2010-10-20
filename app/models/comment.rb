class Comment < ActiveRecord::Base
  
  # Relations
  belongs_to :commentable,
               :polymorphic => true
  belongs_to :commenter,
               :class_name => 'User',
               :foreign_key => 'commenter_id'

  # Validations
  validates_presence_of :body,
                          :commenter_id,
                          :commentable_id,
                          :commentable_type
  validates_length_of :body,
                        :maximum => 140
  
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

