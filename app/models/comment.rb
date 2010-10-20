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
