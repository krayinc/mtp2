module CommentLogic
  module Commentable
    def self.included(base)
      base.extend ClassMethods
    end
    module ClassMethods
      def logic_for_commentable(options={})
        has_many :comments, {:as => :commentable, :dependent => :destroy}.merge(options)
        include CommentLogic::Commentable::InstanceMethods
        extend CommentLogic::Commentable::SingletonMethods
      end
    end
    module InstanceMethods
      def add_comment(comment)
        comments << comment
      end
    end
    module SingletonMethods
    end
  end
end
ActiveRecord::Base.send(:include, CommentLogic::Commentable)